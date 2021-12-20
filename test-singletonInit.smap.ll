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
  %y = alloca %list*
  %tmpElt = alloca i32*
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %eltAddr = bitcast i8* %malloccall to i32*
  store i32* %eltAddr, i32** %tmpElt
  %tmpEltWithVal = load i32*, i32** %tmpElt
  store i32 99, i32* %tmpEltWithVal
  %eltAsChar = bitcast i32* %tmpEltWithVal to i8*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr = bitcast i8* %malloccall1 to %list*
  %add_bad_head = call i32 (%list*, i8*, ...) @bad_add_head(%list* %listAddr, i8* %eltAsChar)
  store %list* %listAddr, %list** %y
  %printint = call i32 @printint(i32 99)
  ret i32 0
}

declare noalias i8* @malloc(i32)
