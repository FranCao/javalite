# "make test" Compiles everything and runs the regression tests

.PHONY : test
test : all testall.sh
	./testall.sh

# "make all" builds the executable as well as the built-in libraries designed
# to test linking external code

.PHONY : all
all : javalite.native reversestring.o stringupper.o stringlower.o stringsubstring.o

# "make javalite.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

javalite.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind javalite.native

# "make clean" removes all generated files

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff

# Testing the "reversestring" example
reversestring : reversestring.c
	cc -o reversestring -DBUILD_TEST reversestring.c

# Testing the "stringupper" example
stringupper : stringupper.c
	cc -o stringupper -DBUILD_TEST stringupper.c

# Testing the "stringlower" example
stringlower : stringlower.c
	cc -o stringlower -DBUILD_TEST stringlower.c

# Testing the "stringsubstring" example
stringlower : stringsubstring.c
	cc -o stringsubstring -DBUILD_TEST stringsubstring.c

# Building the tarball

TESTS = \
  add1 arith1 arith2 arith3 fib float1 float2 float3 for1 for2 func1 \
  func2 func3 func4 func5 func6 func7 func8 func9 gcd2 gcd global1 \
  global2 global3 hello if1 if2 if3 if4 if5 if6 local1 local2 ops1 \
  ops2 var1 var2 while1 while2

FAILS = \
  assign1 assign2 assign3 dead1 dead2 expr1 expr2 expr3 float1 float2 \
  for1 for2 for3 for4 for5 func1 func2 func3 func4 func5 func6 func7 \
  func8 func9 global1 global2 if1 if2 if3 nomain printb print \
  return1 return2 while1 while2

TESTFILES = $(TESTS:%=test-%.jl) $(TESTS:%=test-%.out) \
	    $(FAILS:%=fail-%.jl) $(FAILS:%=fail-%.err)

TARFILES = ast.ml sast.ml codegen.ml Makefile _tags javalite.ml parser.mly \
	README scanner.mll semant.ml testall.sh \
	arcade-font.pbm font2c \
	Dockerfile \
	$(TESTFILES:%=tests/%) 

javalite.tar.gz : $(TARFILES)
	cd .. && tar czf javalite/javalite.tar.gz \
		$(TARFILES:%=javalite/%)