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

declare i32 @divisible(i32, i32)

declare i32 @power(i32, i32)

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
  %i = alloca i32
  %n = alloca i32
  %t1 = alloca i32
  %t2 = alloca i32
  %next = alloca i32
  store i32 3, i32* %i
  store i32 10, i32* %n
  store i32 0, i32* %t1
  store i32 1, i32* %t2
  %t11 = load i32, i32* %t1
  %t22 = load i32, i32* %t2
  %tmp = add i32 %t11, %t22
  store i32 %tmp, i32* %next
  %t13 = load i32, i32* %t1
  %printint = call i32 @printint(i32 %t13)
  %t24 = load i32, i32* %t2
  %printint5 = call i32 @printint(i32 %t24)
  store i32 3, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i15 = load i32, i32* %i
  %n16 = load i32, i32* %n
  %tmp17 = icmp sle i32 %i15, %n16
  br i1 %tmp17, label %while_body, label %merge

while_body:                                       ; preds = %while
  %next6 = load i32, i32* %next
  %printint7 = call i32 @printint(i32 %next6)
  %t28 = load i32, i32* %t2
  store i32 %t28, i32* %t1
  %next9 = load i32, i32* %next
  store i32 %next9, i32* %t2
  %t210 = load i32, i32* %t2
  %t111 = load i32, i32* %t1
  %tmp12 = add i32 %t210, %t111
  store i32 %tmp12, i32* %next
  %i13 = load i32, i32* %i
  %tmp14 = add i32 %i13, 1
  store i32 %tmp14, i32* %i
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}
