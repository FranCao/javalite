#!/bin/sh

# Regression testing script for JavaLite
# Step through a list of files
#  Compile, run, and check the output of each expected-to-work test
#  Compile and check the error of each expected-to-fail test

# Path to the LLVM interpreter
LLI="lli"
#LLI="/usr/local/opt/llvm/bin/lli"

# Path to the LLVM compiler
LLC="llc"

# Path to the C compiler
CC="cc"

# Path to the javalite compiler.  Usually "./javalite.native"
# Try "_build/javalite.native" if ocamlbuild was unable to create a symbolic link.
JAVALITE="./javalite.native"
#JAVALITE="_build/javalite.native"

# Set time limit for all operations
ulimit -t 30

globallog=testall.log
rm -f $globallog
error=0
globalerror=0

keep=0

Usage() {
    echo "Usage: ./BuildAndRun.sh [.jl files]. ex: './BuildAndRun.sh SampleCode1.jl'"
    echo "-h    Print this help"
    exit 1
}

SignalError() {
    if [ $error -eq 0 ] ; then
	echo "FAILED"
	error=1
    fi
    echo "  $1"
}


# Run <args>
# Report the command, run it, and report any errors
Run() {
    echo $* 1>&2
    eval $* || {
	SignalError "$1 failed on $*"
	return 1
    }
}

# RunFail <args>
# Report the command, run it, and expect an error
RunFail() {
    echo $* 1>&2
    eval $* && {
	SignalError "failed: $* did not report an error"
	return 1
    }
    return 0
}

Check() {
    error=0
    basename=`echo $1 | sed 's/.*\\///
                             s/.jl//'`
    reffile=`echo $1 | sed 's/.jl$//'`
    basedir="`echo $1 | sed 's/\/[^\/]*$//'`/."

    #echo -n "$basename..."    
    
    #echo 1>&2
    #echo "###### Testing $basename" 1>&2

    generatedfiles=""

    generatedfiles="$generatedfiles ${basename}.ll ${basename}.s ${basename}.exe ${basename}.out" &&
    Run "$JAVALITE" "$1" ">" "${basename}.ll" &&
    Run "$LLC" "-relocation-model=pic" "${basename}.ll" ">" "${basename}.s" &&
    Run "$CC" "-o" "${basename}.exe" "${basename}.s" "stringfuncs.o" &&
    Run "./${basename}.exe" > "${basename}.out"
    
    cat ${basename}.out
    
    # Report the status and clean up the generated files

    if [ $error -eq 0 ] ; then
	if [ $keep -eq 0 ] ; then
	    rm -f $generatedfiles
	fi	
	#echo "###### SUCCESS" 1>&2
    else
	#echo "###### FAILED" 1>&2
	globalerror=$error
    fi
}

while getopts kdpsh c; do
    case $c in
	k) # Keep intermediate files
	    keep=1
	    ;;
	h) # Help
	    Usage
	    ;;
    esac
done

shift `expr $OPTIND - 1`

LLIFail() {
  echo "Could not find the LLVM interpreter \"$LLI\"."
  echo "Check your LLVM installation and/or modify the LLI variable in testall.sh"
  exit 1
}

which "$LLI" >> $globallog || LLIFail


if [ ! -f stringfuncs.o ]
then
    echo "Could not find stringfuncs.o"
    echo "Try \"make stringfuncs.o\""
    exit 1
fi


if [ $# -ge 1 ]
then
    files=$@    
fi

for file in $files
do
    # echo "Building and Running $file"
    Check $file 2>> $globallog	    
done

exit $globalerror
