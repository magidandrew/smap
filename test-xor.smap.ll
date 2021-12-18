; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

declare i32 @printstr(i8*)

declare i32 @absolute(i32)

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
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
  store i32 5, i32* %a
  store i32 6, i32* %b
  %a1 = load i32, i32* %a
  %b2 = load i32, i32* %b
  %tmp = xor i32 %a1, %b2
  store i32 %tmp, i32* %c
  %c3 = load i32, i32* %c
  %printint = call i32 @printint(i32 %c3)
  ret i32 0
}
