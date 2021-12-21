; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }
%prob = type { %list, %list, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@newLine = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@fmt = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1

declare i32 @printstr(i8*)

declare i32 @printb(i1)

declare i32 @stringLength(i8*)

declare i32 @corresponding_int(i8*, i32)

declare { i8*, i32 } @testMakeStruct(i8*, i32)

declare i32 @printint(i32)

declare i32 @printf(i8*, ...)

declare i32 @push_back(%list*, i8*, ...)

declare i32 @init_list(%list*, ...)

declare i32 @init_prob(%prob*, %list*, %list*, ...)

declare i8* @peek(%prob*, ...)

declare i32 @list_length(%list*, ...)

declare i32 @get_length(%prob*, ...)

declare i8* @get_at(%list*, i32, ...)

declare %list* @set_at(%list*, i32, i8*, ...)

declare i32 @print_list_int(%list*, ...)

declare i32 @print_list_float(%list*, ...)

declare %list* @get_vals(%prob*, ...)

declare %list* @get_probs(%prob*, ...)

declare i32 @print_prob_int_debug(%prob*, ...)

declare i32 @bad_add_head(%list*, i8*, ...)

declare i32 @very_bad_get_head(%list*, ...)

define i32 @main() {
entry:
  %z = alloca double
  %w = alloca double
  %i = alloca i32
  %x = alloca %list*
  store double 4.000000e+00, double* %z
  store double 8.500000e+01, double* %w
  store i32 0, i32* %i
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr = bitcast i8* %malloccall to %list*
  %init_list = call i32 (%list*, ...) @init_list(%list* %listAddr)
  %tmp = alloca double*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr = bitcast i8* %malloccall1 to double*
  store double* %tmpAddr, double** %tmp
  %tmpWithVal = load double*, double** %tmp
  store double 8.000000e-03, double* %tmpWithVal
  %asChar = bitcast double* %tmpWithVal to i8*
  %tmp2 = alloca double*
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr4 = bitcast i8* %malloccall3 to double*
  store double* %tmpAddr4, double** %tmp2
  %tmpWithVal5 = load double*, double** %tmp2
  store double 1.000010e+00, double* %tmpWithVal5
  %asChar6 = bitcast double* %tmpWithVal5 to i8*
  %tmp7 = alloca double*
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr9 = bitcast i8* %malloccall8 to double*
  store double* %tmpAddr9, double** %tmp7
  %tmpWithVal10 = load double*, double** %tmp7
  store double 2.100000e+00, double* %tmpWithVal10
  %asChar11 = bitcast double* %tmpWithVal10 to i8*
  %tmp12 = alloca double*
  %malloccall13 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr14 = bitcast i8* %malloccall13 to double*
  store double* %tmpAddr14, double** %tmp12
  %tmpWithVal15 = load double*, double** %tmp12
  store double 3.500000e+00, double* %tmpWithVal15
  %asChar16 = bitcast double* %tmpWithVal15 to i8*
  %z17 = load double, double* %z
  %tmp18 = alloca double*
  %malloccall19 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr20 = bitcast i8* %malloccall19 to double*
  store double* %tmpAddr20, double** %tmp18
  %tmpWithVal21 = load double*, double** %tmp18
  store double %z17, double* %tmpWithVal21
  %asChar22 = bitcast double* %tmpWithVal21 to i8*
  %tmp23 = alloca double*
  %malloccall24 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr25 = bitcast i8* %malloccall24 to double*
  store double* %tmpAddr25, double** %tmp23
  %tmpWithVal26 = load double*, double** %tmp23
  store double 9.990000e+01, double* %tmpWithVal26
  %asChar27 = bitcast double* %tmpWithVal26 to i8*
  %tmp28 = alloca double*
  %malloccall29 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr30 = bitcast i8* %malloccall29 to double*
  store double* %tmpAddr30, double** %tmp28
  %tmpWithVal31 = load double*, double** %tmp28
  store double 7.200000e+03, double* %tmpWithVal31
  %asChar32 = bitcast double* %tmpWithVal31 to i8*
  %w33 = load double, double* %w
  %tmp34 = fsub double %w33, 1.000000e+00
  %tmp35 = alloca double*
  %malloccall36 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr37 = bitcast i8* %malloccall36 to double*
  store double* %tmpAddr37, double** %tmp35
  %tmpWithVal38 = load double*, double** %tmp35
  store double %tmp34, double* %tmpWithVal38
  %asChar39 = bitcast double* %tmpWithVal38 to i8*
  %push_back = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar)
  %push_back40 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar6)
  %push_back41 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar11)
  %push_back42 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar16)
  %push_back43 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar22)
  %push_back44 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar27)
  %push_back45 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar32)
  %push_back46 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar39)
  store %list* %listAddr, %list** %x
  %x47 = load %list*, %list** %x
  %tmp48 = alloca double*
  %malloccall49 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr50 = bitcast i8* %malloccall49 to double*
  store double* %tmpAddr50, double** %tmp48
  %tmpWithVal51 = load double*, double** %tmp48
  store double 0xC0BC216C985F06F7, double* %tmpWithVal51
  %asChar52 = bitcast double* %tmpWithVal51 to i8*
  %set_at = call %list* (%list*, i32, i8*, ...) @set_at(%list* %x47, i32 6, i8* %asChar52)
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i57 = load i32, i32* %i
  %tmp58 = icmp slt i32 %i57, 8
  br i1 %tmp58, label %while_body, label %merge

while_body:                                       ; preds = %while
  %x53 = load %list*, %list** %x
  %i54 = load i32, i32* %i
  %get_at = call i8* (%list*, i32, ...) @get_at(%list* %x53, i32 %i54)
  %eltAsPtr = bitcast i8* %get_at to double*
  %eltDeref = load double, double* %eltAsPtr
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), double %eltDeref)
  %printstr = call i32 @printstr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @newLine, i32 0, i32 0))
  %i55 = load i32, i32* %i
  %tmp56 = add i32 %i55, 1
  store i32 %tmp56, i32* %i
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}

declare noalias i8* @malloc(i32)
