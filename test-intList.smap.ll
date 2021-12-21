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
  %y = alloca %list*
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr = bitcast i8* %malloccall to %list*
  %init_list = call i32 (%list*, ...) @init_list(%list* %listAddr)
  %tmp = alloca i32*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr = bitcast i8* %malloccall1 to i32*
  store i32* %tmpAddr, i32** %tmp
  %tmpWithVal = load i32*, i32** %tmp
  store i32 99, i32* %tmpWithVal
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
  %tmp17 = alloca i32*
  %malloccall18 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr19 = bitcast i8* %malloccall18 to i32*
  store i32* %tmpAddr19, i32** %tmp17
  %tmpWithVal20 = load i32*, i32** %tmp17
  store i32 4, i32* %tmpWithVal20
  %asChar21 = bitcast i32* %tmpWithVal20 to i8*
  %push_back = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar)
  %push_back22 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar6)
  %push_back23 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar11)
  %push_back24 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar16)
  %push_back25 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar21)
  store %list* %listAddr, %list** %y
  %y26 = load %list*, %list** %y
  %print_list_int = call i32 (%list*, ...) @print_list_int(%list* %y26)
  ret i32 0
}

declare noalias i8* @malloc(i32)
