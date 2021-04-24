; ModuleID = 'JavaLite'
source_filename = "JavaLite"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare i8* @reverse(i8*)

declare i8* @upper(i8*)

declare i8* @lower(i8*)

declare i8* @substring(i8*, i32, i32)

declare i32 @indexOf(i8*, i8*)

declare i32 @len(i8*)

declare i8* @concat(i8*, i8*)

declare i8* @to_string(i8*, ...)

declare i32 @length(i32*)

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 3))
  %arr = bitcast i8* %malloccall to i32**
  %arrptr = bitcast i32** %arr to i32*
  %arrelt = getelementptr i32, i32* %arrptr, i32 0
  store i32 1, i32* %arrelt
  %arrelt1 = getelementptr i32, i32* %arrptr, i32 1
  store i32 2, i32* %arrelt1
  %arrelt2 = getelementptr i32, i32* %arrptr, i32 2
  store i32 3, i32* %arrelt2
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %intArr = bitcast i8* %malloccall3 to i32**
  store i32* %arrptr, i32** %intArr
  %intArr4 = load i32*, i32** %intArr
  %acceltptr = getelementptr i32, i32* %intArr4, i32 0
  %accelt = load i32, i32* %acceltptr
  %malloccall5 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %e = bitcast i8* %malloccall5 to i32*
  store i32 %accelt, i32* %e
  %e6 = load i32, i32* %e
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %e6)
  ret i32 0
}

declare noalias i8* @malloc(i32)
