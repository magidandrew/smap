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
  %p = alloca i32
  %q = alloca i32
  %r = alloca i32
  %s = alloca i32
  store i32 200, i32* %p
  store i32 -200, i32* %q
  %p1 = load i32, i32* %p
  %absolute = call i32 @absolute(i32 %p1)
  store i32 %absolute, i32* %r
  %q2 = load i32, i32* %q
  %absolute3 = call i32 @absolute(i32 %q2)
  store i32 %absolute3, i32* %s
  %s4 = load i32, i32* %s
  %printint = call i32 @printint(i32 %s4)
  ret i32 0
}
