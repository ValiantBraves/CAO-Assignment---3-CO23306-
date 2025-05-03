; ModuleID = 'matrix_mul.ll'
source_filename = "matrix_mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Matrix multiplication completed in %.3f seconds\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @multiply_matrices(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %10

10:                                               ; preds = %62, %3
  %11 = load i32, ptr %7, align 4
  %12 = icmp slt i32 %11, 100
  br i1 %12, label %13, label %65

13:                                               ; preds = %10
  store i32 0, ptr %8, align 4
  br label %14

14:                                               ; preds = %58, %13
  %15 = load i32, ptr %8, align 4
  %16 = icmp slt i32 %15, 100
  br i1 %16, label %17, label %61

17:                                               ; preds = %14
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x float], ptr %18, i64 %20
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x float], ptr %21, i64 0, i64 %23
  store float 0.000000e+00, ptr %24, align 4
  store i32 0, ptr %9, align 4
  br label %25

25:                                               ; preds = %54, %17
  %26 = load i32, ptr %9, align 4
  %27 = icmp slt i32 %26, 100
  br i1 %27, label %28, label %57

28:                                               ; preds = %25
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x float], ptr %29, i64 %31
  %33 = load i32, ptr %9, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x float], ptr %32, i64 0, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x float], ptr %37, i64 %39
  %41 = load i32, ptr %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x float], ptr %40, i64 0, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = load ptr, ptr %6, align 8
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x float], ptr %45, i64 %47
  %49 = load i32, ptr %8, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [100 x float], ptr %48, i64 0, i64 %50
  %52 = load float, ptr %51, align 4
  %53 = call float @llvm.fmuladd.f32(float %36, float %44, float %52)
  store float %53, ptr %51, align 4
  br label %54

54:                                               ; preds = %28
  %55 = load i32, ptr %9, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %9, align 4
  br label %25, !llvm.loop !6

57:                                               ; preds = %25
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %8, align 4
  br label %14, !llvm.loop !8

61:                                               ; preds = %14
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %7, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %7, align 4
  br label %10, !llvm.loop !9

65:                                               ; preds = %10
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x [100 x float]], align 16
  %3 = alloca [100 x [100 x float]], align 16
  %4 = alloca [100 x [100 x float]], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca double, align 8
  store i32 0, ptr %1, align 4
  %10 = call i64 @time(ptr noundef null) #4
  %11 = trunc i64 %10 to i32
  call void @srand(i32 noundef %11) #4
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %48, %0
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 100
  br i1 %14, label %15, label %51

15:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %44, %15
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 100
  br i1 %18, label %19, label %47

19:                                               ; preds = %16
  %20 = call i32 @rand() #4
  %21 = srem i32 %20, 100
  %22 = sitofp i32 %21 to float
  %23 = fpext float %22 to double
  %24 = fdiv double %23, 1.000000e+01
  %25 = fptrunc double %24 to float
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x [100 x float]], ptr %2, i64 0, i64 %27
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x float], ptr %28, i64 0, i64 %30
  store float %25, ptr %31, align 4
  %32 = call i32 @rand() #4
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to float
  %35 = fpext float %34 to double
  %36 = fdiv double %35, 1.000000e+01
  %37 = fptrunc double %36 to float
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x [100 x float]], ptr %3, i64 0, i64 %39
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x float], ptr %40, i64 0, i64 %42
  store float %37, ptr %43, align 4
  br label %44

44:                                               ; preds = %19
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %6, align 4
  br label %16, !llvm.loop !10

47:                                               ; preds = %16
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %5, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %5, align 4
  br label %12, !llvm.loop !11

51:                                               ; preds = %12
  %52 = call i64 @clock() #4
  store i64 %52, ptr %7, align 8
  %53 = getelementptr inbounds [100 x [100 x float]], ptr %2, i64 0, i64 0
  %54 = getelementptr inbounds [100 x [100 x float]], ptr %3, i64 0, i64 0
  %55 = getelementptr inbounds [100 x [100 x float]], ptr %4, i64 0, i64 0
  call void @multiply_matrices(ptr noundef %53, ptr noundef %54, ptr noundef %55)
  %56 = call i64 @clock() #4
  store i64 %56, ptr %8, align 8
  %57 = load i64, ptr %8, align 8
  %58 = load i64, ptr %7, align 8
  %59 = sub nsw i64 %57, %58
  %60 = sitofp i64 %59 to double
  %61 = fdiv double %60, 1.000000e+06
  store double %61, ptr %9, align 8
  %62 = load double, ptr %9, align 8
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %62)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind
declare i64 @clock() #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Debian clang version 19.1.7 (3)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
