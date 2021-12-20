; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@test.2 = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

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
  %num = alloca i32
  %res = alloca i32
  store i32 6, i32* %num
  %num1 = load i32, i32* %num
  %fib_result = call i32 @fib(i32 %num1)
  store i32 %fib_result, i32* %res
  %res2 = load i32, i32* %res
  %printint = call i32 @printint(i32 %res2)
  ret i32 0
}

define i32 @fib(i32 %n) {
entry:
  %n1 = alloca i32
  store i32 %n, i32* %n1
  br label %if

if:                                               ; preds = %entry
  %n3 = load i32, i32* %n1
  %tmp = icmp sle i32 %n3, 1
  br i1 %tmp, label %if_body, label %merge

if_body:                                          ; preds = %if
  %n2 = load i32, i32* %n1
  ret i32 %n2

merge:                                            ; preds = %if
  %n4 = load i32, i32* %n1
  %tmp5 = sub i32 %n4, 1
  %fib_result = call i32 @fib(i32 %tmp5)
  %n6 = load i32, i32* %n1
  %tmp7 = sub i32 %n6, 2
  %fib_result8 = call i32 @fib(i32 %tmp7)
  %tmp9 = add i32 %fib_result, %fib_result8
  ret i32 %tmp9
}
