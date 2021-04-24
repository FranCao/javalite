; ModuleID = 'classinc.c'
source_filename = "classinc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.6"

%struct.square = type { i8*, i32, %struct.square* }

@.str = private unnamed_addr constant [11 x i8] c"fst_square\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
; Function Attrs: noinline nounwind optnone ssp uwtable
define %struct.square* @square_constructor(i8* %0, i32 %1, %struct.square* %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.square*, align 8
  %7 = alloca %struct.square*, align 8
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.square* %2, %struct.square** %6, align 8
  %8 = call i8* @malloc(i64 24) #3
  %9 = bitcast i8* %8 to %struct.square*
  store %struct.square* %9, %struct.square** %7, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = load %struct.square*, %struct.square** %7, align 8
  %12 = getelementptr inbounds %struct.square, %struct.square* %11, i32 0, i32 0
  store i8* %10, i8** %12, align 8
  %13 = load i32, i32* %5, align 4
  %14 = load %struct.square*, %struct.square** %7, align 8
  %15 = getelementptr inbounds %struct.square, %struct.square* %14, i32 0, i32 1
  store i32 %13, i32* %15, align 8
  %16 = load %struct.square*, %struct.square** %6, align 8
  %17 = load %struct.square*, %struct.square** %7, align 8
  %18 = getelementptr inbounds %struct.square, %struct.square* %17, i32 0, i32 2
  store %struct.square* %16, %struct.square** %18, align 8
  %19 = load %struct.square*, %struct.square** %7, align 8
  ret %struct.square* %19
}
; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #1
; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.square*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  %5 = call %struct.square* @square_constructor(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 42, %struct.square* null)
  store %struct.square* %5, %struct.square** %2, align 8
  %6 = load %struct.square*, %struct.square** %2, align 8
  %7 = getelementptr inbounds %struct.square, %struct.square* %6, i32 0, i32 2
  %8 = load %struct.square*, %struct.square** %7, align 8
  %9 = icmp eq %struct.square* %8, null
  br i1 %9, label %10, label %12

10:                                               ; preds = %0
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 1)
  br label %12

12:                                               ; preds = %10, %0
  ret i32 0
}
declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 10, i32 15, i32 6]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Apple clang version 12.0.0 (clang-1200.0.32.21)"}
