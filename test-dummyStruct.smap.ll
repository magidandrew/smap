; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@test.2 = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@the_str = private unnamed_addr constant [14 x i8] c"dummy struct.\00", align 1

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

define i32 @takeDummy({ i8*, i32 } %dumb) {
entry:
  %dumb1 = alloca { i8*, i32 }
  store { i8*, i32 } %dumb, { i8*, i32 }* %dumb1
  ret i32 5
}

define i32 @main() {
entry:
  %dummyStruct = alloca { i8*, i32 }
  %testMakeStruct = call { i8*, i32 } @testMakeStruct(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @test.2, i32 0, i32 0), i32 16)
  %takeDummy_result = call i32 @takeDummy({ i8*, i32 } %testMakeStruct)
  %testMakeStruct1 = call { i8*, i32 } @testMakeStruct(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @test.2, i32 0, i32 0), i32 16)
  %printb = call i32 @printb(i1 false)
  %printstr = call i32 @printstr(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @the_str, i32 0, i32 0))
  ret i32 0
}
