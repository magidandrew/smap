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
  %num = alloca %prob*
  %num2 = alloca %prob*
  %i = alloca i32
  %probs = alloca %list*
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr = bitcast i8* %malloccall to %list*
  %init_list = call i32 (%list*, ...) @init_list(%list* %listAddr)
  %tmp = alloca double*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr = bitcast i8* %malloccall1 to double*
  store double* %tmpAddr, double** %tmp
  %tmpWithVal = load double*, double** %tmp
  store double 2.500000e-01, double* %tmpWithVal
  %asChar = bitcast double* %tmpWithVal to i8*
  %tmp2 = alloca double*
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr4 = bitcast i8* %malloccall3 to double*
  store double* %tmpAddr4, double** %tmp2
  %tmpWithVal5 = load double*, double** %tmp2
  store double 5.000000e-01, double* %tmpWithVal5
  %asChar6 = bitcast double* %tmpWithVal5 to i8*
  %tmp7 = alloca double*
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmpAddr9 = bitcast i8* %malloccall8 to double*
  store double* %tmpAddr9, double** %tmp7
  %tmpWithVal10 = load double*, double** %tmp7
  store double 2.500000e-01, double* %tmpWithVal10
  %asChar11 = bitcast double* %tmpWithVal10 to i8*
  %push_back = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar)
  %push_back12 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar6)
  %push_back13 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar11)
  %malloccall14 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr15 = bitcast i8* %malloccall14 to %list*
  %init_list16 = call i32 (%list*, ...) @init_list(%list* %listAddr15)
  %tmp17 = alloca i32*
  %malloccall18 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr19 = bitcast i8* %malloccall18 to i32*
  store i32* %tmpAddr19, i32** %tmp17
  %tmpWithVal20 = load i32*, i32** %tmp17
  store i32 1, i32* %tmpWithVal20
  %asChar21 = bitcast i32* %tmpWithVal20 to i8*
  %tmp22 = alloca i32*
  %malloccall23 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr24 = bitcast i8* %malloccall23 to i32*
  store i32* %tmpAddr24, i32** %tmp22
  %tmpWithVal25 = load i32*, i32** %tmp22
  store i32 2, i32* %tmpWithVal25
  %asChar26 = bitcast i32* %tmpWithVal25 to i8*
  %tmp27 = alloca i32*
  %malloccall28 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr29 = bitcast i8* %malloccall28 to i32*
  store i32* %tmpAddr29, i32** %tmp27
  %tmpWithVal30 = load i32*, i32** %tmp27
  store i32 3, i32* %tmpWithVal30
  %asChar31 = bitcast i32* %tmpWithVal30 to i8*
  %push_back32 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr15, i8* %asChar21)
  %push_back33 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr15, i8* %asChar26)
  %push_back34 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr15, i8* %asChar31)
  %malloccall35 = tail call i8* @malloc(i32 ptrtoint (%prob* getelementptr (%prob, %prob* null, i32 1) to i32))
  %probAddr = bitcast i8* %malloccall35 to %prob*
  %init_prob = call i32 (%prob*, %list*, %list*, ...) @init_prob(%prob* %probAddr, %list* %listAddr, %list* %listAddr15)
  store %prob* %probAddr, %prob** %num
  %num36 = load %prob*, %prob** %num
  store %prob* %num36, %prob** %num2
  %num37 = load %prob*, %prob** %num
  %get_probs = call %list* (%prob*, ...) @get_probs(%prob* %num37)
  store %list* %get_probs, %list** %probs
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i42 = load i32, i32* %i
  %num43 = load %prob*, %prob** %num
  %get_length = call i32 (%prob*, ...) @get_length(%prob* %num43)
  %tmp44 = icmp slt i32 %i42, %get_length
  br i1 %tmp44, label %while_body, label %merge

while_body:                                       ; preds = %while
  %probs38 = load %list*, %list** %probs
  %i39 = load i32, i32* %i
  %get_at = call i8* (%list*, i32, ...) @get_at(%list* %probs38, i32 %i39)
  %eltAsPtr = bitcast i8* %get_at to double*
  %eltDeref = load double, double* %eltAsPtr
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), double %eltDeref)
  %printstr = call i32 @printstr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @newLine, i32 0, i32 0))
  %i40 = load i32, i32* %i
  %tmp41 = add i32 %i40, 1
  store i32 %tmp41, i32* %i
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}

declare noalias i8* @malloc(i32)
