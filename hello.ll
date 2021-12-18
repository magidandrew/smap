; ModuleID = 'Smap'
source_filename = "Smap"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

declare i32 @printstr(i32)

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %printstr = call i32 @printstr(i32 43110)
  ret i32 0
}
