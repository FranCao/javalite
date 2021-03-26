; ModuleID = 'classInC.c'
source_filename = "classInC.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.6"

%struct.Test = type { i32 }

@.str = private unnamed_addr constant [14 x i8] c"print foo: %d\00", align 1
; Function Attrs: noinline nounwind optnone ssp uwtable
define %struct.Test* @Test_constrcutor(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.Test*, align 8
  store i32 %0, i32* %2, align 4
  %4 = call i8* @malloc(i64 4) #3
  %5 = bitcast i8* %4 to %struct.Test*
  store %struct.Test* %5, %struct.Test** %3, align 8
  %6 = load i32, i32* %2, align 4
  %7 = load %struct.Test*, %struct.Test** %3, align 8
  %8 = getelementptr inbounds %struct.Test, %struct.Test* %7, i32 0, i32 0
  store i32 %6, i32* %8, align 4
  %9 = load %struct.Test*, %struct.Test** %3, align 8
  ret %struct.Test* %9
}
; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #1
; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @Test_foo(%struct.Test* %0, i32 %1) #0 {
  %3 = alloca %struct.Test*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.Test* %0, %struct.Test** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i32, i32* %4, align 4
  %7 = load %struct.Test*, %struct.Test** %3, align 8
  %8 = getelementptr inbounds %struct.Test, %struct.Test* %7, i32 0, i32 0
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %6, %9
  store i32 %10, i32* %5, align 4
  %11 = load i32, i32* %5, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %11)
  %13 = load i32, i32* %5, align 4
  ret i32 %13
}
declare i32 @printf(i8*, ...) #2
; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Test*, align 8
  store i32 0, i32* %1, align 4
  %3 = call %struct.Test* @Test_constrcutor(i32 2)
  store %struct.Test* %3, %struct.Test** %2, align 8
  %4 = load %struct.Test*, %struct.Test** %2, align 8
  %5 = call i32 @Test_foo(%struct.Test* %4, i32 3)
  ret i32 0
}

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
