; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

declare i32 @printstr(i8*)

declare i32 @absolute(i32)

declare i32 @characterLocation(i8*, i8*)

declare i32 @isCompDivisible(i32)

declare i32 @ceilFloat(double)

declare i32 @ascii(i8*)

declare i8* @int_to_char(i32)

declare i32 @stringLength(i8*)

declare i32 @stringReverse(i8*)

declare i32 @printb(i1)

declare { i8*, i32 } @testMakeStruct(i8*, i32)

declare i32 @printint(i32)

declare i32 @printf(i8*, ...)

declare i32 @bad_add_head(%list*, i8*, ...)

declare i32 @very_bad_get_head(%list*, ...)

define i32 @main() {
entry:
  %x = alloca i32
  %y = alloca i32
  store i32 6, i32* %x
  store i32 5, i32* %y
  br label %if

if:                                               ; preds = %entry
  %y1 = load i32, i32* %y
  %x2 = load i32, i32* %x
  %tmp = icmp slt i32 %y1, %x2
  br i1 %tmp, label %if_body, label %merge

if_body:                                          ; preds = %if
  %printint = call i32 @printint(i32 42)
  br label %merge

merge:                                            ; preds = %if, %if_body
  ret i32 0
}
