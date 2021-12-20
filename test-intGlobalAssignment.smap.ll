; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@y = global i32 3
@w = global i32 300
@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

declare i32 @printstr(i8*)

declare i32 @absolute(i32)

declare i32 @characterLocation(i8*, i8*)

declare i32 @isCompDivisible(i32)

declare i32 @divisible(i32, i32)

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
  %w = load i32, i32* @w
  %printint = call i32 @printint(i32 %w)
  store i32 5, i32* @w
  store i32 400, i32* @w
  %w1 = load i32, i32* @w
  %printint2 = call i32 @printint(i32 %w1)
  ret i32 0
}
