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
  %x = alloca i32
  store i32 5, i32* %x
  br label %if

if:                                               ; preds = %entry
  %x3 = load i32, i32* %x
  %tmp4 = icmp sgt i32 %x3, 5
  br i1 %tmp4, label %if_body, label %elif

if_body:                                          ; preds = %if
  %printint = call i32 @printint(i32 1)
  br label %merge

elif:                                             ; preds = %if
  %x1 = load i32, i32* %x
  %tmp = icmp eq i32 %x1, 5
  br i1 %tmp, label %elif_body, label %merge

elif_body:                                        ; preds = %elif
  %printint2 = call i32 @printint(i32 42)
  br label %merge

merge:                                            ; preds = %elif_body, %elif, %if_body
  ret i32 0
}
