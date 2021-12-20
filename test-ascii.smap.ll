; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@the_str = private unnamed_addr constant [2 x i8] c"a\00", align 1

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
  %x = alloca i8*
  %ascii_values = alloca i32
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @the_str, i32 0, i32 0), i8** %x
  %x1 = load i8*, i8** %x
  %ascii = call i32 @ascii(i8* %x1)
  store i32 %ascii, i32* %ascii_values
  %ascii_values2 = load i32, i32* %ascii_values
  %printint = call i32 @printint(i32 %ascii_values2)
  ret i32 0
}
