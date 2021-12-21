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
  %push_back = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar)
  store %list* %listAddr, %list** %y
  %y2 = load %list*, %list** %y
  %print_list_int = call i32 (%list*, ...) @print_list_int(%list* %y2)
  ret i32 0
}

declare noalias i8* @malloc(i32)
