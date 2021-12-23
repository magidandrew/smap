; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }
%prob = type { %list, %list, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@newLine = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@fmt = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1

declare i32 @printstr(i8*)

declare i32 @printchar(i8)

declare i32 @print_list_char(%list*)

declare i32 @printb(i1)

declare { i8*, i32 } @testMakeStruct(i8*, i32)

declare i32 @printint(i32)

declare i32 @printf(i8*, ...)

declare i32 @push_front(%list*, i8*, ...)

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
  %y = alloca i32
  store i32 5, i32* %x
  store i32 6, i32* %y
  br label %if

if:                                               ; preds = %entry
  %x2 = load i32, i32* %x
  %y3 = load i32, i32* %y
  %tmp = icmp sgt i32 %x2, %y3
  br i1 %tmp, label %if_body, label %else_body

if_body:                                          ; preds = %if
  %printint = call i32 @printint(i32 42)
  br label %merge

else_body:                                        ; preds = %if
  %printint1 = call i32 @printint(i32 1)
  br label %merge

merge:                                            ; preds = %else_body, %if_body
  br label %if4

if4:                                              ; preds = %merge
  %x10 = load i32, i32* %x
  %y11 = load i32, i32* %y
  %tmp12 = icmp slt i32 %x10, %y11
  br i1 %tmp12, label %if_body5, label %else_body6

if_body5:                                         ; preds = %if4
  %printint8 = call i32 @printint(i32 24)
  br label %merge7

else_body6:                                       ; preds = %if4
  %printint9 = call i32 @printint(i32 2)
  br label %merge7

merge7:                                           ; preds = %else_body6, %if_body5
  ret i32 0
}
