; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@the_str = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1

declare i32 @printstr(i8*)

declare i32 @absolute(i32)

declare i32 @isCompDivisible(i32)

declare double @ceilFloat(double)

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
  %my_len = alloca i32
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @the_str, i32 0, i32 0), i8** %x
  %x1 = load i8*, i8** %x
  %stringLength = call i32 @stringLength(i8* %x1)
  store i32 %stringLength, i32* %my_len
  %my_len2 = load i32, i32* %my_len
  %printint = call i32 @printint(i32 %my_len2)
  ret i32 0
}
