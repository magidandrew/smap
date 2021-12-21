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
  %z = alloca i32
  %w = alloca i32
  %x = alloca %list*
  store i32 4, i32* %z
  store i32 85, i32* %w
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr = bitcast i8* %malloccall to %list*
  %init_list = call i32 (%list*, ...) @init_list(%list* %listAddr)
  %tmp = alloca i32*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr = bitcast i8* %malloccall1 to i32*
  store i32* %tmpAddr, i32** %tmp
  %tmpWithVal = load i32*, i32** %tmp
  store i32 0, i32* %tmpWithVal
  %asChar = bitcast i32* %tmpWithVal to i8*
  %tmp2 = alloca i32*
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr4 = bitcast i8* %malloccall3 to i32*
  store i32* %tmpAddr4, i32** %tmp2
  %tmpWithVal5 = load i32*, i32** %tmp2
  store i32 1, i32* %tmpWithVal5
  %asChar6 = bitcast i32* %tmpWithVal5 to i8*
  %tmp7 = alloca i32*
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr9 = bitcast i8* %malloccall8 to i32*
  store i32* %tmpAddr9, i32** %tmp7
  %tmpWithVal10 = load i32*, i32** %tmp7
  store i32 2, i32* %tmpWithVal10
  %asChar11 = bitcast i32* %tmpWithVal10 to i8*
  %tmp12 = alloca i32*
  %malloccall13 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr14 = bitcast i8* %malloccall13 to i32*
  store i32* %tmpAddr14, i32** %tmp12
  %tmpWithVal15 = load i32*, i32** %tmp12
  store i32 3, i32* %tmpWithVal15
  %asChar16 = bitcast i32* %tmpWithVal15 to i8*
  %z17 = load i32, i32* %z
  %tmp18 = alloca i32*
  %malloccall19 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr20 = bitcast i8* %malloccall19 to i32*
  store i32* %tmpAddr20, i32** %tmp18
  %tmpWithVal21 = load i32*, i32** %tmp18
  store i32 %z17, i32* %tmpWithVal21
  %asChar22 = bitcast i32* %tmpWithVal21 to i8*
  %tmp23 = alloca i32*
  %malloccall24 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr25 = bitcast i8* %malloccall24 to i32*
  store i32* %tmpAddr25, i32** %tmp23
  %tmpWithVal26 = load i32*, i32** %tmp23
  store i32 99, i32* %tmpWithVal26
  %asChar27 = bitcast i32* %tmpWithVal26 to i8*
  %tmp28 = alloca i32*
  %malloccall29 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr30 = bitcast i8* %malloccall29 to i32*
  store i32* %tmpAddr30, i32** %tmp28
  %tmpWithVal31 = load i32*, i32** %tmp28
  store i32 7200, i32* %tmpWithVal31
  %asChar32 = bitcast i32* %tmpWithVal31 to i8*
  %w33 = load i32, i32* %w
  %tmp34 = sub i32 %w33, 1
  %tmp35 = alloca i32*
  %malloccall36 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr37 = bitcast i8* %malloccall36 to i32*
  store i32* %tmpAddr37, i32** %tmp35
  %tmpWithVal38 = load i32*, i32** %tmp35
  store i32 %tmp34, i32* %tmpWithVal38
  %asChar39 = bitcast i32* %tmpWithVal38 to i8*
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
  %tmp48 = alloca i32*
  %malloccall49 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr50 = bitcast i8* %malloccall49 to i32*
  store i32* %tmpAddr50, i32** %tmp48
  %tmpWithVal51 = load i32*, i32** %tmp48
  store i32 -7201, i32* %tmpWithVal51
  %asChar52 = bitcast i32* %tmpWithVal51 to i8*
  %set_at = call %list* (%list*, i32, i8*, ...) @set_at(%list* %x47, i32 6, i8* %asChar52)
  %x53 = load %list*, %list** %x
  %print_list_int = call i32 (%list*, ...) @print_list_int(%list* %x53)
  ret i32 0
}

declare noalias i8* @malloc(i32)
