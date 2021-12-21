; ModuleID = 'Smap'
source_filename = "Smap"

%list = type { i8**, i32, i32 }
%prob = type { %list, %list, i32 }

@test = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@newLine = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@fmt = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@the_str = private unnamed_addr constant [66 x i8] c"ZEROSIXHUNDREEDHOURSWEATHERTODAYISCLEARRAININTHEEVENINGHEILHITLER\00", align 1
@test.2 = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@newLine.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@fmt.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@fmt.5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@test.6 = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@newLine.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@fmt.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@fmt.9 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@test.10 = private unnamed_addr constant [17 x i8] c"test test test!\0A\00", align 1
@newLine.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@fmt.12 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@fmt.13 = private unnamed_addr constant [3 x i8] c"%f\00", align 1

declare i32 @printstr(i8*)

declare i32 @printb(i1)

declare i32 @stringLength(i8*)

declare i32 @corresponding_int(i8*, i32)

declare { i8*, i32 } @testMakeStruct(i8*, i32)

declare i32 @printint(i32)

declare i32 @printf(i8*, ...)

declare i32 @push_back(%list*, i8*, ...)

declare i32 @init_list(%list*, ...)

declare i32 @init_prob(%prob*, %list*, %list*, ...)

declare i8* @peek(%prob*, ...)

declare i32 @list_length(%list*, ...)

declare i32 @get_length(%prob*, ...)

declare i8* @get_at(%list*, i32, ...)

declare %list* @set_at(%list*, i32, i8*, ...)

declare i32 @print_list_int(%list*, ...)

declare i32 @print_list_float(%list*, ...)

declare %list* @get_vals(%prob*, ...)

declare %list* @get_probs(%prob*, ...)

declare i32 @print_prob_int_debug(%prob*, ...)

declare i32 @bad_add_head(%list*, i8*, ...)

declare i32 @very_bad_get_head(%list*, ...)

define i32 @main() {
entry:
  %location_on_initialization_array = alloca i32
  %plugboard_input_count = alloca i32
  %temp = alloca %list*
  %messagez = alloca i8*
  %input_text = alloca %list*
  %what_is_len = alloca i32
  %key = alloca %list*
  %ring_setting = alloca %list*
  %rotor_three_out = alloca %list*
  %rotor_three_in = alloca %list*
  %rotor_two_out = alloca %list*
  %rotor_two_in = alloca %list*
  %rotor_one_out = alloca %list*
  %rotor_one_in = alloca %list*
  store i32 0, i32* %location_on_initialization_array
  store i32 0, i32* %plugboard_input_count
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr = bitcast i8* %malloccall to %list*
  %init_list = call i32 (%list*, ...) @init_list(%list* %listAddr)
  %tmp = alloca i32*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr = bitcast i8* %malloccall1 to i32*
  store i32* %tmpAddr, i32** %tmp
  %tmpWithVal = load i32*, i32** %tmp
  store i32 1, i32* %tmpWithVal
  %asChar = bitcast i32* %tmpWithVal to i8*
  %push_back = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr, i8* %asChar)
  store %list* %listAddr, %list** %temp
  store i8* getelementptr inbounds ([66 x i8], [66 x i8]* @the_str, i32 0, i32 0), i8** %messagez
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr3 = bitcast i8* %malloccall2 to %list*
  %init_list4 = call i32 (%list*, ...) @init_list(%list* %listAddr3)
  %tmp5 = alloca i32*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr7 = bitcast i8* %malloccall6 to i32*
  store i32* %tmpAddr7, i32** %tmp5
  %tmpWithVal8 = load i32*, i32** %tmp5
  store i32 1, i32* %tmpWithVal8
  %asChar9 = bitcast i32* %tmpWithVal8 to i8*
  %push_back10 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr3, i8* %asChar9)
  store %list* %listAddr3, %list** %input_text
  %messagez11 = load i8*, i8** %messagez
  %corresponding_int = call i32 @corresponding_int(i8* %messagez11, i32 0)
  store i32 %corresponding_int, i32* %what_is_len
  %malloccall12 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr13 = bitcast i8* %malloccall12 to %list*
  %init_list14 = call i32 (%list*, ...) @init_list(%list* %listAddr13)
  %tmp15 = alloca i32*
  %malloccall16 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr17 = bitcast i8* %malloccall16 to i32*
  store i32* %tmpAddr17, i32** %tmp15
  %tmpWithVal18 = load i32*, i32** %tmp15
  store i32 18, i32* %tmpWithVal18
  %asChar19 = bitcast i32* %tmpWithVal18 to i8*
  %tmp20 = alloca i32*
  %malloccall21 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr22 = bitcast i8* %malloccall21 to i32*
  store i32* %tmpAddr22, i32** %tmp20
  %tmpWithVal23 = load i32*, i32** %tmp20
  store i32 8, i32* %tmpWithVal23
  %asChar24 = bitcast i32* %tmpWithVal23 to i8*
  %tmp25 = alloca i32*
  %malloccall26 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr27 = bitcast i8* %malloccall26 to i32*
  store i32* %tmpAddr27, i32** %tmp25
  %tmpWithVal28 = load i32*, i32** %tmp25
  store i32 6, i32* %tmpWithVal28
  %asChar29 = bitcast i32* %tmpWithVal28 to i8*
  %push_back30 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr13, i8* %asChar19)
  %push_back31 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr13, i8* %asChar24)
  %push_back32 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr13, i8* %asChar29)
  store %list* %listAddr13, %list** %key
  %malloccall33 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr34 = bitcast i8* %malloccall33 to %list*
  %init_list35 = call i32 (%list*, ...) @init_list(%list* %listAddr34)
  %tmp36 = alloca i32*
  %malloccall37 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr38 = bitcast i8* %malloccall37 to i32*
  store i32* %tmpAddr38, i32** %tmp36
  %tmpWithVal39 = load i32*, i32** %tmp36
  store i32 15, i32* %tmpWithVal39
  %asChar40 = bitcast i32* %tmpWithVal39 to i8*
  %tmp41 = alloca i32*
  %malloccall42 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr43 = bitcast i8* %malloccall42 to i32*
  store i32* %tmpAddr43, i32** %tmp41
  %tmpWithVal44 = load i32*, i32** %tmp41
  store i32 12, i32* %tmpWithVal44
  %asChar45 = bitcast i32* %tmpWithVal44 to i8*
  %tmp46 = alloca i32*
  %malloccall47 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr48 = bitcast i8* %malloccall47 to i32*
  store i32* %tmpAddr48, i32** %tmp46
  %tmpWithVal49 = load i32*, i32** %tmp46
  store i32 15, i32* %tmpWithVal49
  %asChar50 = bitcast i32* %tmpWithVal49 to i8*
  %push_back51 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr34, i8* %asChar40)
  %push_back52 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr34, i8* %asChar45)
  %push_back53 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr34, i8* %asChar50)
  store %list* %listAddr34, %list** %ring_setting
  %malloccall54 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr55 = bitcast i8* %malloccall54 to %list*
  %init_list56 = call i32 (%list*, ...) @init_list(%list* %listAddr55)
  %tmp57 = alloca i32*
  %malloccall58 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr59 = bitcast i8* %malloccall58 to i32*
  store i32* %tmpAddr59, i32** %tmp57
  %tmpWithVal60 = load i32*, i32** %tmp57
  store i32 1, i32* %tmpWithVal60
  %asChar61 = bitcast i32* %tmpWithVal60 to i8*
  %tmp62 = alloca i32*
  %malloccall63 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr64 = bitcast i8* %malloccall63 to i32*
  store i32* %tmpAddr64, i32** %tmp62
  %tmpWithVal65 = load i32*, i32** %tmp62
  store i32 3, i32* %tmpWithVal65
  %asChar66 = bitcast i32* %tmpWithVal65 to i8*
  %tmp67 = alloca i32*
  %malloccall68 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr69 = bitcast i8* %malloccall68 to i32*
  store i32* %tmpAddr69, i32** %tmp67
  %tmpWithVal70 = load i32*, i32** %tmp67
  store i32 5, i32* %tmpWithVal70
  %asChar71 = bitcast i32* %tmpWithVal70 to i8*
  %tmp72 = alloca i32*
  %malloccall73 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr74 = bitcast i8* %malloccall73 to i32*
  store i32* %tmpAddr74, i32** %tmp72
  %tmpWithVal75 = load i32*, i32** %tmp72
  store i32 7, i32* %tmpWithVal75
  %asChar76 = bitcast i32* %tmpWithVal75 to i8*
  %tmp77 = alloca i32*
  %malloccall78 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr79 = bitcast i8* %malloccall78 to i32*
  store i32* %tmpAddr79, i32** %tmp77
  %tmpWithVal80 = load i32*, i32** %tmp77
  store i32 9, i32* %tmpWithVal80
  %asChar81 = bitcast i32* %tmpWithVal80 to i8*
  %tmp82 = alloca i32*
  %malloccall83 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr84 = bitcast i8* %malloccall83 to i32*
  store i32* %tmpAddr84, i32** %tmp82
  %tmpWithVal85 = load i32*, i32** %tmp82
  store i32 11, i32* %tmpWithVal85
  %asChar86 = bitcast i32* %tmpWithVal85 to i8*
  %tmp87 = alloca i32*
  %malloccall88 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr89 = bitcast i8* %malloccall88 to i32*
  store i32* %tmpAddr89, i32** %tmp87
  %tmpWithVal90 = load i32*, i32** %tmp87
  store i32 2, i32* %tmpWithVal90
  %asChar91 = bitcast i32* %tmpWithVal90 to i8*
  %tmp92 = alloca i32*
  %malloccall93 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr94 = bitcast i8* %malloccall93 to i32*
  store i32* %tmpAddr94, i32** %tmp92
  %tmpWithVal95 = load i32*, i32** %tmp92
  store i32 15, i32* %tmpWithVal95
  %asChar96 = bitcast i32* %tmpWithVal95 to i8*
  %tmp97 = alloca i32*
  %malloccall98 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr99 = bitcast i8* %malloccall98 to i32*
  store i32* %tmpAddr99, i32** %tmp97
  %tmpWithVal100 = load i32*, i32** %tmp97
  store i32 17, i32* %tmpWithVal100
  %asChar101 = bitcast i32* %tmpWithVal100 to i8*
  %tmp102 = alloca i32*
  %malloccall103 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr104 = bitcast i8* %malloccall103 to i32*
  store i32* %tmpAddr104, i32** %tmp102
  %tmpWithVal105 = load i32*, i32** %tmp102
  store i32 19, i32* %tmpWithVal105
  %asChar106 = bitcast i32* %tmpWithVal105 to i8*
  %tmp107 = alloca i32*
  %malloccall108 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr109 = bitcast i8* %malloccall108 to i32*
  store i32* %tmpAddr109, i32** %tmp107
  %tmpWithVal110 = load i32*, i32** %tmp107
  store i32 23, i32* %tmpWithVal110
  %asChar111 = bitcast i32* %tmpWithVal110 to i8*
  %tmp112 = alloca i32*
  %malloccall113 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr114 = bitcast i8* %malloccall113 to i32*
  store i32* %tmpAddr114, i32** %tmp112
  %tmpWithVal115 = load i32*, i32** %tmp112
  store i32 21, i32* %tmpWithVal115
  %asChar116 = bitcast i32* %tmpWithVal115 to i8*
  %tmp117 = alloca i32*
  %malloccall118 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr119 = bitcast i8* %malloccall118 to i32*
  store i32* %tmpAddr119, i32** %tmp117
  %tmpWithVal120 = load i32*, i32** %tmp117
  store i32 25, i32* %tmpWithVal120
  %asChar121 = bitcast i32* %tmpWithVal120 to i8*
  %tmp122 = alloca i32*
  %malloccall123 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr124 = bitcast i8* %malloccall123 to i32*
  store i32* %tmpAddr124, i32** %tmp122
  %tmpWithVal125 = load i32*, i32** %tmp122
  store i32 13, i32* %tmpWithVal125
  %asChar126 = bitcast i32* %tmpWithVal125 to i8*
  %tmp127 = alloca i32*
  %malloccall128 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr129 = bitcast i8* %malloccall128 to i32*
  store i32* %tmpAddr129, i32** %tmp127
  %tmpWithVal130 = load i32*, i32** %tmp127
  store i32 24, i32* %tmpWithVal130
  %asChar131 = bitcast i32* %tmpWithVal130 to i8*
  %tmp132 = alloca i32*
  %malloccall133 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr134 = bitcast i8* %malloccall133 to i32*
  store i32* %tmpAddr134, i32** %tmp132
  %tmpWithVal135 = load i32*, i32** %tmp132
  store i32 4, i32* %tmpWithVal135
  %asChar136 = bitcast i32* %tmpWithVal135 to i8*
  %tmp137 = alloca i32*
  %malloccall138 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr139 = bitcast i8* %malloccall138 to i32*
  store i32* %tmpAddr139, i32** %tmp137
  %tmpWithVal140 = load i32*, i32** %tmp137
  store i32 8, i32* %tmpWithVal140
  %asChar141 = bitcast i32* %tmpWithVal140 to i8*
  %tmp142 = alloca i32*
  %malloccall143 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr144 = bitcast i8* %malloccall143 to i32*
  store i32* %tmpAddr144, i32** %tmp142
  %tmpWithVal145 = load i32*, i32** %tmp142
  store i32 22, i32* %tmpWithVal145
  %asChar146 = bitcast i32* %tmpWithVal145 to i8*
  %tmp147 = alloca i32*
  %malloccall148 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr149 = bitcast i8* %malloccall148 to i32*
  store i32* %tmpAddr149, i32** %tmp147
  %tmpWithVal150 = load i32*, i32** %tmp147
  store i32 6, i32* %tmpWithVal150
  %asChar151 = bitcast i32* %tmpWithVal150 to i8*
  %tmp152 = alloca i32*
  %malloccall153 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr154 = bitcast i8* %malloccall153 to i32*
  store i32* %tmpAddr154, i32** %tmp152
  %tmpWithVal155 = load i32*, i32** %tmp152
  store i32 0, i32* %tmpWithVal155
  %asChar156 = bitcast i32* %tmpWithVal155 to i8*
  %tmp157 = alloca i32*
  %malloccall158 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr159 = bitcast i8* %malloccall158 to i32*
  store i32* %tmpAddr159, i32** %tmp157
  %tmpWithVal160 = load i32*, i32** %tmp157
  store i32 10, i32* %tmpWithVal160
  %asChar161 = bitcast i32* %tmpWithVal160 to i8*
  %tmp162 = alloca i32*
  %malloccall163 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr164 = bitcast i8* %malloccall163 to i32*
  store i32* %tmpAddr164, i32** %tmp162
  %tmpWithVal165 = load i32*, i32** %tmp162
  store i32 12, i32* %tmpWithVal165
  %asChar166 = bitcast i32* %tmpWithVal165 to i8*
  %tmp167 = alloca i32*
  %malloccall168 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr169 = bitcast i8* %malloccall168 to i32*
  store i32* %tmpAddr169, i32** %tmp167
  %tmpWithVal170 = load i32*, i32** %tmp167
  store i32 20, i32* %tmpWithVal170
  %asChar171 = bitcast i32* %tmpWithVal170 to i8*
  %tmp172 = alloca i32*
  %malloccall173 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr174 = bitcast i8* %malloccall173 to i32*
  store i32* %tmpAddr174, i32** %tmp172
  %tmpWithVal175 = load i32*, i32** %tmp172
  store i32 18, i32* %tmpWithVal175
  %asChar176 = bitcast i32* %tmpWithVal175 to i8*
  %tmp177 = alloca i32*
  %malloccall178 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr179 = bitcast i8* %malloccall178 to i32*
  store i32* %tmpAddr179, i32** %tmp177
  %tmpWithVal180 = load i32*, i32** %tmp177
  store i32 16, i32* %tmpWithVal180
  %asChar181 = bitcast i32* %tmpWithVal180 to i8*
  %tmp182 = alloca i32*
  %malloccall183 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr184 = bitcast i8* %malloccall183 to i32*
  store i32* %tmpAddr184, i32** %tmp182
  %tmpWithVal185 = load i32*, i32** %tmp182
  store i32 14, i32* %tmpWithVal185
  %asChar186 = bitcast i32* %tmpWithVal185 to i8*
  %push_back187 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar61)
  %push_back188 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar66)
  %push_back189 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar71)
  %push_back190 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar76)
  %push_back191 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar81)
  %push_back192 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar86)
  %push_back193 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar91)
  %push_back194 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar96)
  %push_back195 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar101)
  %push_back196 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar106)
  %push_back197 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar111)
  %push_back198 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar116)
  %push_back199 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar121)
  %push_back200 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar126)
  %push_back201 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar131)
  %push_back202 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar136)
  %push_back203 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar141)
  %push_back204 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar146)
  %push_back205 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar151)
  %push_back206 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar156)
  %push_back207 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar161)
  %push_back208 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar166)
  %push_back209 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar171)
  %push_back210 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar176)
  %push_back211 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar181)
  %push_back212 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr55, i8* %asChar186)
  store %list* %listAddr55, %list** %rotor_three_out
  %malloccall213 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr214 = bitcast i8* %malloccall213 to %list*
  %init_list215 = call i32 (%list*, ...) @init_list(%list* %listAddr214)
  %tmp216 = alloca i32*
  %malloccall217 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr218 = bitcast i8* %malloccall217 to i32*
  store i32* %tmpAddr218, i32** %tmp216
  %tmpWithVal219 = load i32*, i32** %tmp216
  store i32 0, i32* %tmpWithVal219
  %asChar220 = bitcast i32* %tmpWithVal219 to i8*
  %tmp221 = alloca i32*
  %malloccall222 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr223 = bitcast i8* %malloccall222 to i32*
  store i32* %tmpAddr223, i32** %tmp221
  %tmpWithVal224 = load i32*, i32** %tmp221
  store i32 1, i32* %tmpWithVal224
  %asChar225 = bitcast i32* %tmpWithVal224 to i8*
  %tmp226 = alloca i32*
  %malloccall227 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr228 = bitcast i8* %malloccall227 to i32*
  store i32* %tmpAddr228, i32** %tmp226
  %tmpWithVal229 = load i32*, i32** %tmp226
  store i32 2, i32* %tmpWithVal229
  %asChar230 = bitcast i32* %tmpWithVal229 to i8*
  %tmp231 = alloca i32*
  %malloccall232 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr233 = bitcast i8* %malloccall232 to i32*
  store i32* %tmpAddr233, i32** %tmp231
  %tmpWithVal234 = load i32*, i32** %tmp231
  store i32 3, i32* %tmpWithVal234
  %asChar235 = bitcast i32* %tmpWithVal234 to i8*
  %tmp236 = alloca i32*
  %malloccall237 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr238 = bitcast i8* %malloccall237 to i32*
  store i32* %tmpAddr238, i32** %tmp236
  %tmpWithVal239 = load i32*, i32** %tmp236
  store i32 4, i32* %tmpWithVal239
  %asChar240 = bitcast i32* %tmpWithVal239 to i8*
  %tmp241 = alloca i32*
  %malloccall242 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr243 = bitcast i8* %malloccall242 to i32*
  store i32* %tmpAddr243, i32** %tmp241
  %tmpWithVal244 = load i32*, i32** %tmp241
  store i32 5, i32* %tmpWithVal244
  %asChar245 = bitcast i32* %tmpWithVal244 to i8*
  %tmp246 = alloca i32*
  %malloccall247 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr248 = bitcast i8* %malloccall247 to i32*
  store i32* %tmpAddr248, i32** %tmp246
  %tmpWithVal249 = load i32*, i32** %tmp246
  store i32 6, i32* %tmpWithVal249
  %asChar250 = bitcast i32* %tmpWithVal249 to i8*
  %tmp251 = alloca i32*
  %malloccall252 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr253 = bitcast i8* %malloccall252 to i32*
  store i32* %tmpAddr253, i32** %tmp251
  %tmpWithVal254 = load i32*, i32** %tmp251
  store i32 7, i32* %tmpWithVal254
  %asChar255 = bitcast i32* %tmpWithVal254 to i8*
  %tmp256 = alloca i32*
  %malloccall257 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr258 = bitcast i8* %malloccall257 to i32*
  store i32* %tmpAddr258, i32** %tmp256
  %tmpWithVal259 = load i32*, i32** %tmp256
  store i32 8, i32* %tmpWithVal259
  %asChar260 = bitcast i32* %tmpWithVal259 to i8*
  %tmp261 = alloca i32*
  %malloccall262 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr263 = bitcast i8* %malloccall262 to i32*
  store i32* %tmpAddr263, i32** %tmp261
  %tmpWithVal264 = load i32*, i32** %tmp261
  store i32 9, i32* %tmpWithVal264
  %asChar265 = bitcast i32* %tmpWithVal264 to i8*
  %tmp266 = alloca i32*
  %malloccall267 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr268 = bitcast i8* %malloccall267 to i32*
  store i32* %tmpAddr268, i32** %tmp266
  %tmpWithVal269 = load i32*, i32** %tmp266
  store i32 10, i32* %tmpWithVal269
  %asChar270 = bitcast i32* %tmpWithVal269 to i8*
  %tmp271 = alloca i32*
  %malloccall272 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr273 = bitcast i8* %malloccall272 to i32*
  store i32* %tmpAddr273, i32** %tmp271
  %tmpWithVal274 = load i32*, i32** %tmp271
  store i32 11, i32* %tmpWithVal274
  %asChar275 = bitcast i32* %tmpWithVal274 to i8*
  %tmp276 = alloca i32*
  %malloccall277 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr278 = bitcast i8* %malloccall277 to i32*
  store i32* %tmpAddr278, i32** %tmp276
  %tmpWithVal279 = load i32*, i32** %tmp276
  store i32 12, i32* %tmpWithVal279
  %asChar280 = bitcast i32* %tmpWithVal279 to i8*
  %tmp281 = alloca i32*
  %malloccall282 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr283 = bitcast i8* %malloccall282 to i32*
  store i32* %tmpAddr283, i32** %tmp281
  %tmpWithVal284 = load i32*, i32** %tmp281
  store i32 13, i32* %tmpWithVal284
  %asChar285 = bitcast i32* %tmpWithVal284 to i8*
  %tmp286 = alloca i32*
  %malloccall287 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr288 = bitcast i8* %malloccall287 to i32*
  store i32* %tmpAddr288, i32** %tmp286
  %tmpWithVal289 = load i32*, i32** %tmp286
  store i32 14, i32* %tmpWithVal289
  %asChar290 = bitcast i32* %tmpWithVal289 to i8*
  %tmp291 = alloca i32*
  %malloccall292 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr293 = bitcast i8* %malloccall292 to i32*
  store i32* %tmpAddr293, i32** %tmp291
  %tmpWithVal294 = load i32*, i32** %tmp291
  store i32 15, i32* %tmpWithVal294
  %asChar295 = bitcast i32* %tmpWithVal294 to i8*
  %tmp296 = alloca i32*
  %malloccall297 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr298 = bitcast i8* %malloccall297 to i32*
  store i32* %tmpAddr298, i32** %tmp296
  %tmpWithVal299 = load i32*, i32** %tmp296
  store i32 16, i32* %tmpWithVal299
  %asChar300 = bitcast i32* %tmpWithVal299 to i8*
  %tmp301 = alloca i32*
  %malloccall302 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr303 = bitcast i8* %malloccall302 to i32*
  store i32* %tmpAddr303, i32** %tmp301
  %tmpWithVal304 = load i32*, i32** %tmp301
  store i32 17, i32* %tmpWithVal304
  %asChar305 = bitcast i32* %tmpWithVal304 to i8*
  %tmp306 = alloca i32*
  %malloccall307 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr308 = bitcast i8* %malloccall307 to i32*
  store i32* %tmpAddr308, i32** %tmp306
  %tmpWithVal309 = load i32*, i32** %tmp306
  store i32 18, i32* %tmpWithVal309
  %asChar310 = bitcast i32* %tmpWithVal309 to i8*
  %tmp311 = alloca i32*
  %malloccall312 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr313 = bitcast i8* %malloccall312 to i32*
  store i32* %tmpAddr313, i32** %tmp311
  %tmpWithVal314 = load i32*, i32** %tmp311
  store i32 19, i32* %tmpWithVal314
  %asChar315 = bitcast i32* %tmpWithVal314 to i8*
  %tmp316 = alloca i32*
  %malloccall317 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr318 = bitcast i8* %malloccall317 to i32*
  store i32* %tmpAddr318, i32** %tmp316
  %tmpWithVal319 = load i32*, i32** %tmp316
  store i32 20, i32* %tmpWithVal319
  %asChar320 = bitcast i32* %tmpWithVal319 to i8*
  %tmp321 = alloca i32*
  %malloccall322 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr323 = bitcast i8* %malloccall322 to i32*
  store i32* %tmpAddr323, i32** %tmp321
  %tmpWithVal324 = load i32*, i32** %tmp321
  store i32 21, i32* %tmpWithVal324
  %asChar325 = bitcast i32* %tmpWithVal324 to i8*
  %tmp326 = alloca i32*
  %malloccall327 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr328 = bitcast i8* %malloccall327 to i32*
  store i32* %tmpAddr328, i32** %tmp326
  %tmpWithVal329 = load i32*, i32** %tmp326
  store i32 22, i32* %tmpWithVal329
  %asChar330 = bitcast i32* %tmpWithVal329 to i8*
  %tmp331 = alloca i32*
  %malloccall332 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr333 = bitcast i8* %malloccall332 to i32*
  store i32* %tmpAddr333, i32** %tmp331
  %tmpWithVal334 = load i32*, i32** %tmp331
  store i32 23, i32* %tmpWithVal334
  %asChar335 = bitcast i32* %tmpWithVal334 to i8*
  %tmp336 = alloca i32*
  %malloccall337 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr338 = bitcast i8* %malloccall337 to i32*
  store i32* %tmpAddr338, i32** %tmp336
  %tmpWithVal339 = load i32*, i32** %tmp336
  store i32 24, i32* %tmpWithVal339
  %asChar340 = bitcast i32* %tmpWithVal339 to i8*
  %tmp341 = alloca i32*
  %malloccall342 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr343 = bitcast i8* %malloccall342 to i32*
  store i32* %tmpAddr343, i32** %tmp341
  %tmpWithVal344 = load i32*, i32** %tmp341
  store i32 25, i32* %tmpWithVal344
  %asChar345 = bitcast i32* %tmpWithVal344 to i8*
  %push_back346 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar220)
  %push_back347 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar225)
  %push_back348 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar230)
  %push_back349 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar235)
  %push_back350 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar240)
  %push_back351 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar245)
  %push_back352 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar250)
  %push_back353 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar255)
  %push_back354 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar260)
  %push_back355 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar265)
  %push_back356 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar270)
  %push_back357 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar275)
  %push_back358 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar280)
  %push_back359 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar285)
  %push_back360 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar290)
  %push_back361 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar295)
  %push_back362 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar300)
  %push_back363 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar305)
  %push_back364 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar310)
  %push_back365 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar315)
  %push_back366 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar320)
  %push_back367 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar325)
  %push_back368 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar330)
  %push_back369 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar335)
  %push_back370 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar340)
  %push_back371 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr214, i8* %asChar345)
  store %list* %listAddr214, %list** %rotor_three_in
  %malloccall372 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr373 = bitcast i8* %malloccall372 to %list*
  %init_list374 = call i32 (%list*, ...) @init_list(%list* %listAddr373)
  %tmp375 = alloca i32*
  %malloccall376 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr377 = bitcast i8* %malloccall376 to i32*
  store i32* %tmpAddr377, i32** %tmp375
  %tmpWithVal378 = load i32*, i32** %tmp375
  store i32 0, i32* %tmpWithVal378
  %asChar379 = bitcast i32* %tmpWithVal378 to i8*
  %tmp380 = alloca i32*
  %malloccall381 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr382 = bitcast i8* %malloccall381 to i32*
  store i32* %tmpAddr382, i32** %tmp380
  %tmpWithVal383 = load i32*, i32** %tmp380
  store i32 9, i32* %tmpWithVal383
  %asChar384 = bitcast i32* %tmpWithVal383 to i8*
  %tmp385 = alloca i32*
  %malloccall386 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr387 = bitcast i8* %malloccall386 to i32*
  store i32* %tmpAddr387, i32** %tmp385
  %tmpWithVal388 = load i32*, i32** %tmp385
  store i32 3, i32* %tmpWithVal388
  %asChar389 = bitcast i32* %tmpWithVal388 to i8*
  %tmp390 = alloca i32*
  %malloccall391 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr392 = bitcast i8* %malloccall391 to i32*
  store i32* %tmpAddr392, i32** %tmp390
  %tmpWithVal393 = load i32*, i32** %tmp390
  store i32 10, i32* %tmpWithVal393
  %asChar394 = bitcast i32* %tmpWithVal393 to i8*
  %tmp395 = alloca i32*
  %malloccall396 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr397 = bitcast i8* %malloccall396 to i32*
  store i32* %tmpAddr397, i32** %tmp395
  %tmpWithVal398 = load i32*, i32** %tmp395
  store i32 18, i32* %tmpWithVal398
  %asChar399 = bitcast i32* %tmpWithVal398 to i8*
  %tmp400 = alloca i32*
  %malloccall401 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr402 = bitcast i8* %malloccall401 to i32*
  store i32* %tmpAddr402, i32** %tmp400
  %tmpWithVal403 = load i32*, i32** %tmp400
  store i32 8, i32* %tmpWithVal403
  %asChar404 = bitcast i32* %tmpWithVal403 to i8*
  %tmp405 = alloca i32*
  %malloccall406 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr407 = bitcast i8* %malloccall406 to i32*
  store i32* %tmpAddr407, i32** %tmp405
  %tmpWithVal408 = load i32*, i32** %tmp405
  store i32 17, i32* %tmpWithVal408
  %asChar409 = bitcast i32* %tmpWithVal408 to i8*
  %tmp410 = alloca i32*
  %malloccall411 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr412 = bitcast i8* %malloccall411 to i32*
  store i32* %tmpAddr412, i32** %tmp410
  %tmpWithVal413 = load i32*, i32** %tmp410
  store i32 20, i32* %tmpWithVal413
  %asChar414 = bitcast i32* %tmpWithVal413 to i8*
  %tmp415 = alloca i32*
  %malloccall416 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr417 = bitcast i8* %malloccall416 to i32*
  store i32* %tmpAddr417, i32** %tmp415
  %tmpWithVal418 = load i32*, i32** %tmp415
  store i32 23, i32* %tmpWithVal418
  %asChar419 = bitcast i32* %tmpWithVal418 to i8*
  %tmp420 = alloca i32*
  %malloccall421 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr422 = bitcast i8* %malloccall421 to i32*
  store i32* %tmpAddr422, i32** %tmp420
  %tmpWithVal423 = load i32*, i32** %tmp420
  store i32 1, i32* %tmpWithVal423
  %asChar424 = bitcast i32* %tmpWithVal423 to i8*
  %tmp425 = alloca i32*
  %malloccall426 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr427 = bitcast i8* %malloccall426 to i32*
  store i32* %tmpAddr427, i32** %tmp425
  %tmpWithVal428 = load i32*, i32** %tmp425
  store i32 11, i32* %tmpWithVal428
  %asChar429 = bitcast i32* %tmpWithVal428 to i8*
  %tmp430 = alloca i32*
  %malloccall431 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr432 = bitcast i8* %malloccall431 to i32*
  store i32* %tmpAddr432, i32** %tmp430
  %tmpWithVal433 = load i32*, i32** %tmp430
  store i32 7, i32* %tmpWithVal433
  %asChar434 = bitcast i32* %tmpWithVal433 to i8*
  %tmp435 = alloca i32*
  %malloccall436 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr437 = bitcast i8* %malloccall436 to i32*
  store i32* %tmpAddr437, i32** %tmp435
  %tmpWithVal438 = load i32*, i32** %tmp435
  store i32 22, i32* %tmpWithVal438
  %asChar439 = bitcast i32* %tmpWithVal438 to i8*
  %tmp440 = alloca i32*
  %malloccall441 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr442 = bitcast i8* %malloccall441 to i32*
  store i32* %tmpAddr442, i32** %tmp440
  %tmpWithVal443 = load i32*, i32** %tmp440
  store i32 19, i32* %tmpWithVal443
  %asChar444 = bitcast i32* %tmpWithVal443 to i8*
  %tmp445 = alloca i32*
  %malloccall446 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr447 = bitcast i8* %malloccall446 to i32*
  store i32* %tmpAddr447, i32** %tmp445
  %tmpWithVal448 = load i32*, i32** %tmp445
  store i32 12, i32* %tmpWithVal448
  %asChar449 = bitcast i32* %tmpWithVal448 to i8*
  %tmp450 = alloca i32*
  %malloccall451 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr452 = bitcast i8* %malloccall451 to i32*
  store i32* %tmpAddr452, i32** %tmp450
  %tmpWithVal453 = load i32*, i32** %tmp450
  store i32 2, i32* %tmpWithVal453
  %asChar454 = bitcast i32* %tmpWithVal453 to i8*
  %tmp455 = alloca i32*
  %malloccall456 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr457 = bitcast i8* %malloccall456 to i32*
  store i32* %tmpAddr457, i32** %tmp455
  %tmpWithVal458 = load i32*, i32** %tmp455
  store i32 16, i32* %tmpWithVal458
  %asChar459 = bitcast i32* %tmpWithVal458 to i8*
  %tmp460 = alloca i32*
  %malloccall461 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr462 = bitcast i8* %malloccall461 to i32*
  store i32* %tmpAddr462, i32** %tmp460
  %tmpWithVal463 = load i32*, i32** %tmp460
  store i32 6, i32* %tmpWithVal463
  %asChar464 = bitcast i32* %tmpWithVal463 to i8*
  %tmp465 = alloca i32*
  %malloccall466 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr467 = bitcast i8* %malloccall466 to i32*
  store i32* %tmpAddr467, i32** %tmp465
  %tmpWithVal468 = load i32*, i32** %tmp465
  store i32 25, i32* %tmpWithVal468
  %asChar469 = bitcast i32* %tmpWithVal468 to i8*
  %tmp470 = alloca i32*
  %malloccall471 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr472 = bitcast i8* %malloccall471 to i32*
  store i32* %tmpAddr472, i32** %tmp470
  %tmpWithVal473 = load i32*, i32** %tmp470
  store i32 13, i32* %tmpWithVal473
  %asChar474 = bitcast i32* %tmpWithVal473 to i8*
  %tmp475 = alloca i32*
  %malloccall476 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr477 = bitcast i8* %malloccall476 to i32*
  store i32* %tmpAddr477, i32** %tmp475
  %tmpWithVal478 = load i32*, i32** %tmp475
  store i32 15, i32* %tmpWithVal478
  %asChar479 = bitcast i32* %tmpWithVal478 to i8*
  %tmp480 = alloca i32*
  %malloccall481 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr482 = bitcast i8* %malloccall481 to i32*
  store i32* %tmpAddr482, i32** %tmp480
  %tmpWithVal483 = load i32*, i32** %tmp480
  store i32 24, i32* %tmpWithVal483
  %asChar484 = bitcast i32* %tmpWithVal483 to i8*
  %tmp485 = alloca i32*
  %malloccall486 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr487 = bitcast i8* %malloccall486 to i32*
  store i32* %tmpAddr487, i32** %tmp485
  %tmpWithVal488 = load i32*, i32** %tmp485
  store i32 5, i32* %tmpWithVal488
  %asChar489 = bitcast i32* %tmpWithVal488 to i8*
  %tmp490 = alloca i32*
  %malloccall491 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr492 = bitcast i8* %malloccall491 to i32*
  store i32* %tmpAddr492, i32** %tmp490
  %tmpWithVal493 = load i32*, i32** %tmp490
  store i32 21, i32* %tmpWithVal493
  %asChar494 = bitcast i32* %tmpWithVal493 to i8*
  %tmp495 = alloca i32*
  %malloccall496 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr497 = bitcast i8* %malloccall496 to i32*
  store i32* %tmpAddr497, i32** %tmp495
  %tmpWithVal498 = load i32*, i32** %tmp495
  store i32 14, i32* %tmpWithVal498
  %asChar499 = bitcast i32* %tmpWithVal498 to i8*
  %tmp500 = alloca i32*
  %malloccall501 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr502 = bitcast i8* %malloccall501 to i32*
  store i32* %tmpAddr502, i32** %tmp500
  %tmpWithVal503 = load i32*, i32** %tmp500
  store i32 4, i32* %tmpWithVal503
  %asChar504 = bitcast i32* %tmpWithVal503 to i8*
  %push_back505 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar379)
  %push_back506 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar384)
  %push_back507 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar389)
  %push_back508 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar394)
  %push_back509 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar399)
  %push_back510 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar404)
  %push_back511 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar409)
  %push_back512 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar414)
  %push_back513 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar419)
  %push_back514 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar424)
  %push_back515 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar429)
  %push_back516 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar434)
  %push_back517 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar439)
  %push_back518 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar444)
  %push_back519 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar449)
  %push_back520 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar454)
  %push_back521 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar459)
  %push_back522 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar464)
  %push_back523 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar469)
  %push_back524 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar474)
  %push_back525 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar479)
  %push_back526 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar484)
  %push_back527 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar489)
  %push_back528 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar494)
  %push_back529 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar499)
  %push_back530 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr373, i8* %asChar504)
  store %list* %listAddr373, %list** %rotor_two_out
  %malloccall531 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr532 = bitcast i8* %malloccall531 to %list*
  %init_list533 = call i32 (%list*, ...) @init_list(%list* %listAddr532)
  %tmp534 = alloca i32*
  %malloccall535 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr536 = bitcast i8* %malloccall535 to i32*
  store i32* %tmpAddr536, i32** %tmp534
  %tmpWithVal537 = load i32*, i32** %tmp534
  store i32 0, i32* %tmpWithVal537
  %asChar538 = bitcast i32* %tmpWithVal537 to i8*
  %tmp539 = alloca i32*
  %malloccall540 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr541 = bitcast i8* %malloccall540 to i32*
  store i32* %tmpAddr541, i32** %tmp539
  %tmpWithVal542 = load i32*, i32** %tmp539
  store i32 1, i32* %tmpWithVal542
  %asChar543 = bitcast i32* %tmpWithVal542 to i8*
  %tmp544 = alloca i32*
  %malloccall545 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr546 = bitcast i8* %malloccall545 to i32*
  store i32* %tmpAddr546, i32** %tmp544
  %tmpWithVal547 = load i32*, i32** %tmp544
  store i32 2, i32* %tmpWithVal547
  %asChar548 = bitcast i32* %tmpWithVal547 to i8*
  %tmp549 = alloca i32*
  %malloccall550 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr551 = bitcast i8* %malloccall550 to i32*
  store i32* %tmpAddr551, i32** %tmp549
  %tmpWithVal552 = load i32*, i32** %tmp549
  store i32 3, i32* %tmpWithVal552
  %asChar553 = bitcast i32* %tmpWithVal552 to i8*
  %tmp554 = alloca i32*
  %malloccall555 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr556 = bitcast i8* %malloccall555 to i32*
  store i32* %tmpAddr556, i32** %tmp554
  %tmpWithVal557 = load i32*, i32** %tmp554
  store i32 4, i32* %tmpWithVal557
  %asChar558 = bitcast i32* %tmpWithVal557 to i8*
  %tmp559 = alloca i32*
  %malloccall560 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr561 = bitcast i8* %malloccall560 to i32*
  store i32* %tmpAddr561, i32** %tmp559
  %tmpWithVal562 = load i32*, i32** %tmp559
  store i32 5, i32* %tmpWithVal562
  %asChar563 = bitcast i32* %tmpWithVal562 to i8*
  %tmp564 = alloca i32*
  %malloccall565 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr566 = bitcast i8* %malloccall565 to i32*
  store i32* %tmpAddr566, i32** %tmp564
  %tmpWithVal567 = load i32*, i32** %tmp564
  store i32 6, i32* %tmpWithVal567
  %asChar568 = bitcast i32* %tmpWithVal567 to i8*
  %tmp569 = alloca i32*
  %malloccall570 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr571 = bitcast i8* %malloccall570 to i32*
  store i32* %tmpAddr571, i32** %tmp569
  %tmpWithVal572 = load i32*, i32** %tmp569
  store i32 7, i32* %tmpWithVal572
  %asChar573 = bitcast i32* %tmpWithVal572 to i8*
  %tmp574 = alloca i32*
  %malloccall575 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr576 = bitcast i8* %malloccall575 to i32*
  store i32* %tmpAddr576, i32** %tmp574
  %tmpWithVal577 = load i32*, i32** %tmp574
  store i32 8, i32* %tmpWithVal577
  %asChar578 = bitcast i32* %tmpWithVal577 to i8*
  %tmp579 = alloca i32*
  %malloccall580 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr581 = bitcast i8* %malloccall580 to i32*
  store i32* %tmpAddr581, i32** %tmp579
  %tmpWithVal582 = load i32*, i32** %tmp579
  store i32 9, i32* %tmpWithVal582
  %asChar583 = bitcast i32* %tmpWithVal582 to i8*
  %tmp584 = alloca i32*
  %malloccall585 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr586 = bitcast i8* %malloccall585 to i32*
  store i32* %tmpAddr586, i32** %tmp584
  %tmpWithVal587 = load i32*, i32** %tmp584
  store i32 10, i32* %tmpWithVal587
  %asChar588 = bitcast i32* %tmpWithVal587 to i8*
  %tmp589 = alloca i32*
  %malloccall590 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr591 = bitcast i8* %malloccall590 to i32*
  store i32* %tmpAddr591, i32** %tmp589
  %tmpWithVal592 = load i32*, i32** %tmp589
  store i32 11, i32* %tmpWithVal592
  %asChar593 = bitcast i32* %tmpWithVal592 to i8*
  %tmp594 = alloca i32*
  %malloccall595 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr596 = bitcast i8* %malloccall595 to i32*
  store i32* %tmpAddr596, i32** %tmp594
  %tmpWithVal597 = load i32*, i32** %tmp594
  store i32 12, i32* %tmpWithVal597
  %asChar598 = bitcast i32* %tmpWithVal597 to i8*
  %tmp599 = alloca i32*
  %malloccall600 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr601 = bitcast i8* %malloccall600 to i32*
  store i32* %tmpAddr601, i32** %tmp599
  %tmpWithVal602 = load i32*, i32** %tmp599
  store i32 13, i32* %tmpWithVal602
  %asChar603 = bitcast i32* %tmpWithVal602 to i8*
  %tmp604 = alloca i32*
  %malloccall605 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr606 = bitcast i8* %malloccall605 to i32*
  store i32* %tmpAddr606, i32** %tmp604
  %tmpWithVal607 = load i32*, i32** %tmp604
  store i32 14, i32* %tmpWithVal607
  %asChar608 = bitcast i32* %tmpWithVal607 to i8*
  %tmp609 = alloca i32*
  %malloccall610 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr611 = bitcast i8* %malloccall610 to i32*
  store i32* %tmpAddr611, i32** %tmp609
  %tmpWithVal612 = load i32*, i32** %tmp609
  store i32 15, i32* %tmpWithVal612
  %asChar613 = bitcast i32* %tmpWithVal612 to i8*
  %tmp614 = alloca i32*
  %malloccall615 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr616 = bitcast i8* %malloccall615 to i32*
  store i32* %tmpAddr616, i32** %tmp614
  %tmpWithVal617 = load i32*, i32** %tmp614
  store i32 16, i32* %tmpWithVal617
  %asChar618 = bitcast i32* %tmpWithVal617 to i8*
  %tmp619 = alloca i32*
  %malloccall620 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr621 = bitcast i8* %malloccall620 to i32*
  store i32* %tmpAddr621, i32** %tmp619
  %tmpWithVal622 = load i32*, i32** %tmp619
  store i32 17, i32* %tmpWithVal622
  %asChar623 = bitcast i32* %tmpWithVal622 to i8*
  %tmp624 = alloca i32*
  %malloccall625 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr626 = bitcast i8* %malloccall625 to i32*
  store i32* %tmpAddr626, i32** %tmp624
  %tmpWithVal627 = load i32*, i32** %tmp624
  store i32 18, i32* %tmpWithVal627
  %asChar628 = bitcast i32* %tmpWithVal627 to i8*
  %tmp629 = alloca i32*
  %malloccall630 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr631 = bitcast i8* %malloccall630 to i32*
  store i32* %tmpAddr631, i32** %tmp629
  %tmpWithVal632 = load i32*, i32** %tmp629
  store i32 19, i32* %tmpWithVal632
  %asChar633 = bitcast i32* %tmpWithVal632 to i8*
  %tmp634 = alloca i32*
  %malloccall635 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr636 = bitcast i8* %malloccall635 to i32*
  store i32* %tmpAddr636, i32** %tmp634
  %tmpWithVal637 = load i32*, i32** %tmp634
  store i32 20, i32* %tmpWithVal637
  %asChar638 = bitcast i32* %tmpWithVal637 to i8*
  %tmp639 = alloca i32*
  %malloccall640 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr641 = bitcast i8* %malloccall640 to i32*
  store i32* %tmpAddr641, i32** %tmp639
  %tmpWithVal642 = load i32*, i32** %tmp639
  store i32 21, i32* %tmpWithVal642
  %asChar643 = bitcast i32* %tmpWithVal642 to i8*
  %tmp644 = alloca i32*
  %malloccall645 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr646 = bitcast i8* %malloccall645 to i32*
  store i32* %tmpAddr646, i32** %tmp644
  %tmpWithVal647 = load i32*, i32** %tmp644
  store i32 22, i32* %tmpWithVal647
  %asChar648 = bitcast i32* %tmpWithVal647 to i8*
  %tmp649 = alloca i32*
  %malloccall650 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr651 = bitcast i8* %malloccall650 to i32*
  store i32* %tmpAddr651, i32** %tmp649
  %tmpWithVal652 = load i32*, i32** %tmp649
  store i32 23, i32* %tmpWithVal652
  %asChar653 = bitcast i32* %tmpWithVal652 to i8*
  %tmp654 = alloca i32*
  %malloccall655 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr656 = bitcast i8* %malloccall655 to i32*
  store i32* %tmpAddr656, i32** %tmp654
  %tmpWithVal657 = load i32*, i32** %tmp654
  store i32 24, i32* %tmpWithVal657
  %asChar658 = bitcast i32* %tmpWithVal657 to i8*
  %tmp659 = alloca i32*
  %malloccall660 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr661 = bitcast i8* %malloccall660 to i32*
  store i32* %tmpAddr661, i32** %tmp659
  %tmpWithVal662 = load i32*, i32** %tmp659
  store i32 25, i32* %tmpWithVal662
  %asChar663 = bitcast i32* %tmpWithVal662 to i8*
  %push_back664 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar538)
  %push_back665 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar543)
  %push_back666 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar548)
  %push_back667 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar553)
  %push_back668 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar558)
  %push_back669 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar563)
  %push_back670 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar568)
  %push_back671 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar573)
  %push_back672 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar578)
  %push_back673 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar583)
  %push_back674 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar588)
  %push_back675 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar593)
  %push_back676 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar598)
  %push_back677 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar603)
  %push_back678 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar608)
  %push_back679 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar613)
  %push_back680 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar618)
  %push_back681 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar623)
  %push_back682 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar628)
  %push_back683 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar633)
  %push_back684 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar638)
  %push_back685 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar643)
  %push_back686 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar648)
  %push_back687 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar653)
  %push_back688 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar658)
  %push_back689 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr532, i8* %asChar663)
  store %list* %listAddr532, %list** %rotor_two_in
  %malloccall690 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr691 = bitcast i8* %malloccall690 to %list*
  %init_list692 = call i32 (%list*, ...) @init_list(%list* %listAddr691)
  %tmp693 = alloca i32*
  %malloccall694 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr695 = bitcast i8* %malloccall694 to i32*
  store i32* %tmpAddr695, i32** %tmp693
  %tmpWithVal696 = load i32*, i32** %tmp693
  store i32 4, i32* %tmpWithVal696
  %asChar697 = bitcast i32* %tmpWithVal696 to i8*
  %tmp698 = alloca i32*
  %malloccall699 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr700 = bitcast i8* %malloccall699 to i32*
  store i32* %tmpAddr700, i32** %tmp698
  %tmpWithVal701 = load i32*, i32** %tmp698
  store i32 10, i32* %tmpWithVal701
  %asChar702 = bitcast i32* %tmpWithVal701 to i8*
  %tmp703 = alloca i32*
  %malloccall704 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr705 = bitcast i8* %malloccall704 to i32*
  store i32* %tmpAddr705, i32** %tmp703
  %tmpWithVal706 = load i32*, i32** %tmp703
  store i32 12, i32* %tmpWithVal706
  %asChar707 = bitcast i32* %tmpWithVal706 to i8*
  %tmp708 = alloca i32*
  %malloccall709 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr710 = bitcast i8* %malloccall709 to i32*
  store i32* %tmpAddr710, i32** %tmp708
  %tmpWithVal711 = load i32*, i32** %tmp708
  store i32 5, i32* %tmpWithVal711
  %asChar712 = bitcast i32* %tmpWithVal711 to i8*
  %tmp713 = alloca i32*
  %malloccall714 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr715 = bitcast i8* %malloccall714 to i32*
  store i32* %tmpAddr715, i32** %tmp713
  %tmpWithVal716 = load i32*, i32** %tmp713
  store i32 11, i32* %tmpWithVal716
  %asChar717 = bitcast i32* %tmpWithVal716 to i8*
  %tmp718 = alloca i32*
  %malloccall719 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr720 = bitcast i8* %malloccall719 to i32*
  store i32* %tmpAddr720, i32** %tmp718
  %tmpWithVal721 = load i32*, i32** %tmp718
  store i32 6, i32* %tmpWithVal721
  %asChar722 = bitcast i32* %tmpWithVal721 to i8*
  %tmp723 = alloca i32*
  %malloccall724 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr725 = bitcast i8* %malloccall724 to i32*
  store i32* %tmpAddr725, i32** %tmp723
  %tmpWithVal726 = load i32*, i32** %tmp723
  store i32 3, i32* %tmpWithVal726
  %asChar727 = bitcast i32* %tmpWithVal726 to i8*
  %tmp728 = alloca i32*
  %malloccall729 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr730 = bitcast i8* %malloccall729 to i32*
  store i32* %tmpAddr730, i32** %tmp728
  %tmpWithVal731 = load i32*, i32** %tmp728
  store i32 16, i32* %tmpWithVal731
  %asChar732 = bitcast i32* %tmpWithVal731 to i8*
  %tmp733 = alloca i32*
  %malloccall734 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr735 = bitcast i8* %malloccall734 to i32*
  store i32* %tmpAddr735, i32** %tmp733
  %tmpWithVal736 = load i32*, i32** %tmp733
  store i32 21, i32* %tmpWithVal736
  %asChar737 = bitcast i32* %tmpWithVal736 to i8*
  %tmp738 = alloca i32*
  %malloccall739 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr740 = bitcast i8* %malloccall739 to i32*
  store i32* %tmpAddr740, i32** %tmp738
  %tmpWithVal741 = load i32*, i32** %tmp738
  store i32 25, i32* %tmpWithVal741
  %asChar742 = bitcast i32* %tmpWithVal741 to i8*
  %tmp743 = alloca i32*
  %malloccall744 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr745 = bitcast i8* %malloccall744 to i32*
  store i32* %tmpAddr745, i32** %tmp743
  %tmpWithVal746 = load i32*, i32** %tmp743
  store i32 13, i32* %tmpWithVal746
  %asChar747 = bitcast i32* %tmpWithVal746 to i8*
  %tmp748 = alloca i32*
  %malloccall749 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr750 = bitcast i8* %malloccall749 to i32*
  store i32* %tmpAddr750, i32** %tmp748
  %tmpWithVal751 = load i32*, i32** %tmp748
  store i32 19, i32* %tmpWithVal751
  %asChar752 = bitcast i32* %tmpWithVal751 to i8*
  %tmp753 = alloca i32*
  %malloccall754 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr755 = bitcast i8* %malloccall754 to i32*
  store i32* %tmpAddr755, i32** %tmp753
  %tmpWithVal756 = load i32*, i32** %tmp753
  store i32 14, i32* %tmpWithVal756
  %asChar757 = bitcast i32* %tmpWithVal756 to i8*
  %tmp758 = alloca i32*
  %malloccall759 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr760 = bitcast i8* %malloccall759 to i32*
  store i32* %tmpAddr760, i32** %tmp758
  %tmpWithVal761 = load i32*, i32** %tmp758
  store i32 22, i32* %tmpWithVal761
  %asChar762 = bitcast i32* %tmpWithVal761 to i8*
  %tmp763 = alloca i32*
  %malloccall764 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr765 = bitcast i8* %malloccall764 to i32*
  store i32* %tmpAddr765, i32** %tmp763
  %tmpWithVal766 = load i32*, i32** %tmp763
  store i32 24, i32* %tmpWithVal766
  %asChar767 = bitcast i32* %tmpWithVal766 to i8*
  %tmp768 = alloca i32*
  %malloccall769 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr770 = bitcast i8* %malloccall769 to i32*
  store i32* %tmpAddr770, i32** %tmp768
  %tmpWithVal771 = load i32*, i32** %tmp768
  store i32 7, i32* %tmpWithVal771
  %asChar772 = bitcast i32* %tmpWithVal771 to i8*
  %tmp773 = alloca i32*
  %malloccall774 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr775 = bitcast i8* %malloccall774 to i32*
  store i32* %tmpAddr775, i32** %tmp773
  %tmpWithVal776 = load i32*, i32** %tmp773
  store i32 23, i32* %tmpWithVal776
  %asChar777 = bitcast i32* %tmpWithVal776 to i8*
  %tmp778 = alloca i32*
  %malloccall779 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr780 = bitcast i8* %malloccall779 to i32*
  store i32* %tmpAddr780, i32** %tmp778
  %tmpWithVal781 = load i32*, i32** %tmp778
  store i32 20, i32* %tmpWithVal781
  %asChar782 = bitcast i32* %tmpWithVal781 to i8*
  %tmp783 = alloca i32*
  %malloccall784 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr785 = bitcast i8* %malloccall784 to i32*
  store i32* %tmpAddr785, i32** %tmp783
  %tmpWithVal786 = load i32*, i32** %tmp783
  store i32 18, i32* %tmpWithVal786
  %asChar787 = bitcast i32* %tmpWithVal786 to i8*
  %tmp788 = alloca i32*
  %malloccall789 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr790 = bitcast i8* %malloccall789 to i32*
  store i32* %tmpAddr790, i32** %tmp788
  %tmpWithVal791 = load i32*, i32** %tmp788
  store i32 15, i32* %tmpWithVal791
  %asChar792 = bitcast i32* %tmpWithVal791 to i8*
  %tmp793 = alloca i32*
  %malloccall794 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr795 = bitcast i8* %malloccall794 to i32*
  store i32* %tmpAddr795, i32** %tmp793
  %tmpWithVal796 = load i32*, i32** %tmp793
  store i32 0, i32* %tmpWithVal796
  %asChar797 = bitcast i32* %tmpWithVal796 to i8*
  %tmp798 = alloca i32*
  %malloccall799 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr800 = bitcast i8* %malloccall799 to i32*
  store i32* %tmpAddr800, i32** %tmp798
  %tmpWithVal801 = load i32*, i32** %tmp798
  store i32 8, i32* %tmpWithVal801
  %asChar802 = bitcast i32* %tmpWithVal801 to i8*
  %tmp803 = alloca i32*
  %malloccall804 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr805 = bitcast i8* %malloccall804 to i32*
  store i32* %tmpAddr805, i32** %tmp803
  %tmpWithVal806 = load i32*, i32** %tmp803
  store i32 1, i32* %tmpWithVal806
  %asChar807 = bitcast i32* %tmpWithVal806 to i8*
  %tmp808 = alloca i32*
  %malloccall809 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr810 = bitcast i8* %malloccall809 to i32*
  store i32* %tmpAddr810, i32** %tmp808
  %tmpWithVal811 = load i32*, i32** %tmp808
  store i32 17, i32* %tmpWithVal811
  %asChar812 = bitcast i32* %tmpWithVal811 to i8*
  %tmp813 = alloca i32*
  %malloccall814 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr815 = bitcast i8* %malloccall814 to i32*
  store i32* %tmpAddr815, i32** %tmp813
  %tmpWithVal816 = load i32*, i32** %tmp813
  store i32 2, i32* %tmpWithVal816
  %asChar817 = bitcast i32* %tmpWithVal816 to i8*
  %tmp818 = alloca i32*
  %malloccall819 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr820 = bitcast i8* %malloccall819 to i32*
  store i32* %tmpAddr820, i32** %tmp818
  %tmpWithVal821 = load i32*, i32** %tmp818
  store i32 9, i32* %tmpWithVal821
  %asChar822 = bitcast i32* %tmpWithVal821 to i8*
  %push_back823 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar697)
  %push_back824 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar702)
  %push_back825 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar707)
  %push_back826 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar712)
  %push_back827 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar717)
  %push_back828 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar722)
  %push_back829 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar727)
  %push_back830 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar732)
  %push_back831 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar737)
  %push_back832 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar742)
  %push_back833 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar747)
  %push_back834 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar752)
  %push_back835 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar757)
  %push_back836 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar762)
  %push_back837 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar767)
  %push_back838 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar772)
  %push_back839 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar777)
  %push_back840 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar782)
  %push_back841 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar787)
  %push_back842 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar792)
  %push_back843 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar797)
  %push_back844 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar802)
  %push_back845 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar807)
  %push_back846 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar812)
  %push_back847 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar817)
  %push_back848 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr691, i8* %asChar822)
  store %list* %listAddr691, %list** %rotor_one_out
  %malloccall849 = tail call i8* @malloc(i32 ptrtoint (%list* getelementptr (%list, %list* null, i32 1) to i32))
  %listAddr850 = bitcast i8* %malloccall849 to %list*
  %init_list851 = call i32 (%list*, ...) @init_list(%list* %listAddr850)
  %tmp852 = alloca i32*
  %malloccall853 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr854 = bitcast i8* %malloccall853 to i32*
  store i32* %tmpAddr854, i32** %tmp852
  %tmpWithVal855 = load i32*, i32** %tmp852
  store i32 0, i32* %tmpWithVal855
  %asChar856 = bitcast i32* %tmpWithVal855 to i8*
  %tmp857 = alloca i32*
  %malloccall858 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr859 = bitcast i8* %malloccall858 to i32*
  store i32* %tmpAddr859, i32** %tmp857
  %tmpWithVal860 = load i32*, i32** %tmp857
  store i32 1, i32* %tmpWithVal860
  %asChar861 = bitcast i32* %tmpWithVal860 to i8*
  %tmp862 = alloca i32*
  %malloccall863 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr864 = bitcast i8* %malloccall863 to i32*
  store i32* %tmpAddr864, i32** %tmp862
  %tmpWithVal865 = load i32*, i32** %tmp862
  store i32 2, i32* %tmpWithVal865
  %asChar866 = bitcast i32* %tmpWithVal865 to i8*
  %tmp867 = alloca i32*
  %malloccall868 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr869 = bitcast i8* %malloccall868 to i32*
  store i32* %tmpAddr869, i32** %tmp867
  %tmpWithVal870 = load i32*, i32** %tmp867
  store i32 3, i32* %tmpWithVal870
  %asChar871 = bitcast i32* %tmpWithVal870 to i8*
  %tmp872 = alloca i32*
  %malloccall873 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr874 = bitcast i8* %malloccall873 to i32*
  store i32* %tmpAddr874, i32** %tmp872
  %tmpWithVal875 = load i32*, i32** %tmp872
  store i32 4, i32* %tmpWithVal875
  %asChar876 = bitcast i32* %tmpWithVal875 to i8*
  %tmp877 = alloca i32*
  %malloccall878 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr879 = bitcast i8* %malloccall878 to i32*
  store i32* %tmpAddr879, i32** %tmp877
  %tmpWithVal880 = load i32*, i32** %tmp877
  store i32 5, i32* %tmpWithVal880
  %asChar881 = bitcast i32* %tmpWithVal880 to i8*
  %tmp882 = alloca i32*
  %malloccall883 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr884 = bitcast i8* %malloccall883 to i32*
  store i32* %tmpAddr884, i32** %tmp882
  %tmpWithVal885 = load i32*, i32** %tmp882
  store i32 6, i32* %tmpWithVal885
  %asChar886 = bitcast i32* %tmpWithVal885 to i8*
  %tmp887 = alloca i32*
  %malloccall888 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr889 = bitcast i8* %malloccall888 to i32*
  store i32* %tmpAddr889, i32** %tmp887
  %tmpWithVal890 = load i32*, i32** %tmp887
  store i32 7, i32* %tmpWithVal890
  %asChar891 = bitcast i32* %tmpWithVal890 to i8*
  %tmp892 = alloca i32*
  %malloccall893 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr894 = bitcast i8* %malloccall893 to i32*
  store i32* %tmpAddr894, i32** %tmp892
  %tmpWithVal895 = load i32*, i32** %tmp892
  store i32 8, i32* %tmpWithVal895
  %asChar896 = bitcast i32* %tmpWithVal895 to i8*
  %tmp897 = alloca i32*
  %malloccall898 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr899 = bitcast i8* %malloccall898 to i32*
  store i32* %tmpAddr899, i32** %tmp897
  %tmpWithVal900 = load i32*, i32** %tmp897
  store i32 9, i32* %tmpWithVal900
  %asChar901 = bitcast i32* %tmpWithVal900 to i8*
  %tmp902 = alloca i32*
  %malloccall903 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr904 = bitcast i8* %malloccall903 to i32*
  store i32* %tmpAddr904, i32** %tmp902
  %tmpWithVal905 = load i32*, i32** %tmp902
  store i32 10, i32* %tmpWithVal905
  %asChar906 = bitcast i32* %tmpWithVal905 to i8*
  %tmp907 = alloca i32*
  %malloccall908 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr909 = bitcast i8* %malloccall908 to i32*
  store i32* %tmpAddr909, i32** %tmp907
  %tmpWithVal910 = load i32*, i32** %tmp907
  store i32 11, i32* %tmpWithVal910
  %asChar911 = bitcast i32* %tmpWithVal910 to i8*
  %tmp912 = alloca i32*
  %malloccall913 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr914 = bitcast i8* %malloccall913 to i32*
  store i32* %tmpAddr914, i32** %tmp912
  %tmpWithVal915 = load i32*, i32** %tmp912
  store i32 12, i32* %tmpWithVal915
  %asChar916 = bitcast i32* %tmpWithVal915 to i8*
  %tmp917 = alloca i32*
  %malloccall918 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr919 = bitcast i8* %malloccall918 to i32*
  store i32* %tmpAddr919, i32** %tmp917
  %tmpWithVal920 = load i32*, i32** %tmp917
  store i32 13, i32* %tmpWithVal920
  %asChar921 = bitcast i32* %tmpWithVal920 to i8*
  %tmp922 = alloca i32*
  %malloccall923 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr924 = bitcast i8* %malloccall923 to i32*
  store i32* %tmpAddr924, i32** %tmp922
  %tmpWithVal925 = load i32*, i32** %tmp922
  store i32 14, i32* %tmpWithVal925
  %asChar926 = bitcast i32* %tmpWithVal925 to i8*
  %tmp927 = alloca i32*
  %malloccall928 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr929 = bitcast i8* %malloccall928 to i32*
  store i32* %tmpAddr929, i32** %tmp927
  %tmpWithVal930 = load i32*, i32** %tmp927
  store i32 15, i32* %tmpWithVal930
  %asChar931 = bitcast i32* %tmpWithVal930 to i8*
  %tmp932 = alloca i32*
  %malloccall933 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr934 = bitcast i8* %malloccall933 to i32*
  store i32* %tmpAddr934, i32** %tmp932
  %tmpWithVal935 = load i32*, i32** %tmp932
  store i32 16, i32* %tmpWithVal935
  %asChar936 = bitcast i32* %tmpWithVal935 to i8*
  %tmp937 = alloca i32*
  %malloccall938 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr939 = bitcast i8* %malloccall938 to i32*
  store i32* %tmpAddr939, i32** %tmp937
  %tmpWithVal940 = load i32*, i32** %tmp937
  store i32 17, i32* %tmpWithVal940
  %asChar941 = bitcast i32* %tmpWithVal940 to i8*
  %tmp942 = alloca i32*
  %malloccall943 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr944 = bitcast i8* %malloccall943 to i32*
  store i32* %tmpAddr944, i32** %tmp942
  %tmpWithVal945 = load i32*, i32** %tmp942
  store i32 18, i32* %tmpWithVal945
  %asChar946 = bitcast i32* %tmpWithVal945 to i8*
  %tmp947 = alloca i32*
  %malloccall948 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr949 = bitcast i8* %malloccall948 to i32*
  store i32* %tmpAddr949, i32** %tmp947
  %tmpWithVal950 = load i32*, i32** %tmp947
  store i32 19, i32* %tmpWithVal950
  %asChar951 = bitcast i32* %tmpWithVal950 to i8*
  %tmp952 = alloca i32*
  %malloccall953 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr954 = bitcast i8* %malloccall953 to i32*
  store i32* %tmpAddr954, i32** %tmp952
  %tmpWithVal955 = load i32*, i32** %tmp952
  store i32 20, i32* %tmpWithVal955
  %asChar956 = bitcast i32* %tmpWithVal955 to i8*
  %tmp957 = alloca i32*
  %malloccall958 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr959 = bitcast i8* %malloccall958 to i32*
  store i32* %tmpAddr959, i32** %tmp957
  %tmpWithVal960 = load i32*, i32** %tmp957
  store i32 21, i32* %tmpWithVal960
  %asChar961 = bitcast i32* %tmpWithVal960 to i8*
  %tmp962 = alloca i32*
  %malloccall963 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr964 = bitcast i8* %malloccall963 to i32*
  store i32* %tmpAddr964, i32** %tmp962
  %tmpWithVal965 = load i32*, i32** %tmp962
  store i32 22, i32* %tmpWithVal965
  %asChar966 = bitcast i32* %tmpWithVal965 to i8*
  %tmp967 = alloca i32*
  %malloccall968 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr969 = bitcast i8* %malloccall968 to i32*
  store i32* %tmpAddr969, i32** %tmp967
  %tmpWithVal970 = load i32*, i32** %tmp967
  store i32 23, i32* %tmpWithVal970
  %asChar971 = bitcast i32* %tmpWithVal970 to i8*
  %tmp972 = alloca i32*
  %malloccall973 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr974 = bitcast i8* %malloccall973 to i32*
  store i32* %tmpAddr974, i32** %tmp972
  %tmpWithVal975 = load i32*, i32** %tmp972
  store i32 24, i32* %tmpWithVal975
  %asChar976 = bitcast i32* %tmpWithVal975 to i8*
  %tmp977 = alloca i32*
  %malloccall978 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr979 = bitcast i8* %malloccall978 to i32*
  store i32* %tmpAddr979, i32** %tmp977
  %tmpWithVal980 = load i32*, i32** %tmp977
  store i32 25, i32* %tmpWithVal980
  %asChar981 = bitcast i32* %tmpWithVal980 to i8*
  %push_back982 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar856)
  %push_back983 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar861)
  %push_back984 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar866)
  %push_back985 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar871)
  %push_back986 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar876)
  %push_back987 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar881)
  %push_back988 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar886)
  %push_back989 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar891)
  %push_back990 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar896)
  %push_back991 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar901)
  %push_back992 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar906)
  %push_back993 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar911)
  %push_back994 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar916)
  %push_back995 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar921)
  %push_back996 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar926)
  %push_back997 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar931)
  %push_back998 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar936)
  %push_back999 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar941)
  %push_back1000 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar946)
  %push_back1001 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar951)
  %push_back1002 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar956)
  %push_back1003 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar961)
  %push_back1004 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar966)
  %push_back1005 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar971)
  %push_back1006 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar976)
  %push_back1007 = call i32 (%list*, i8*, ...) @push_back(%list* %listAddr850, i8* %asChar981)
  store %list* %listAddr850, %list** %rotor_one_in
  %key1008 = load %list*, %list** %key
  %get_at = call i8* (%list*, i32, ...) @get_at(%list* %key1008, i32 0)
  %eltAsPtr = bitcast i8* %get_at to i32*
  %eltDeref = load i32, i32* %eltAsPtr
  %rotor_one_in1009 = load %list*, %list** %rotor_one_in
  %character_location_result = call i32 @character_location(%list* %rotor_one_in1009, i32 %eltDeref)
  store i32 %character_location_result, i32* %location_on_initialization_array
  %location_on_initialization_array1010 = load i32, i32* %location_on_initialization_array
  %rotor_one_in1011 = load %list*, %list** %rotor_one_in
  %rotor_shift_result = call %list* @rotor_shift(%list* %rotor_one_in1011, i32 %location_on_initialization_array1010)
  store %list* %rotor_shift_result, %list** %rotor_one_in
  %ring_setting1012 = load %list*, %list** %ring_setting
  %get_at1013 = call i8* (%list*, i32, ...) @get_at(%list* %ring_setting1012, i32 0)
  %eltAsPtr1014 = bitcast i8* %get_at1013 to i32*
  %eltDeref1015 = load i32, i32* %eltAsPtr1014
  %rotor_one_out1016 = load %list*, %list** %rotor_one_out
  %character_location_result1017 = call i32 @character_location(%list* %rotor_one_out1016, i32 %eltDeref1015)
  store i32 %character_location_result1017, i32* %location_on_initialization_array
  %location_on_initialization_array1018 = load i32, i32* %location_on_initialization_array
  %rotor_one_out1019 = load %list*, %list** %rotor_one_out
  %rotor_shift_result1020 = call %list* @rotor_shift(%list* %rotor_one_out1019, i32 %location_on_initialization_array1018)
  store %list* %rotor_shift_result1020, %list** %rotor_one_out
  %key1021 = load %list*, %list** %key
  %get_at1022 = call i8* (%list*, i32, ...) @get_at(%list* %key1021, i32 1)
  %eltAsPtr1023 = bitcast i8* %get_at1022 to i32*
  %eltDeref1024 = load i32, i32* %eltAsPtr1023
  %rotor_two_in1025 = load %list*, %list** %rotor_two_in
  %character_location_result1026 = call i32 @character_location(%list* %rotor_two_in1025, i32 %eltDeref1024)
  store i32 %character_location_result1026, i32* %location_on_initialization_array
  %location_on_initialization_array1027 = load i32, i32* %location_on_initialization_array
  %rotor_two_in1028 = load %list*, %list** %rotor_two_in
  %rotor_shift_result1029 = call %list* @rotor_shift(%list* %rotor_two_in1028, i32 %location_on_initialization_array1027)
  store %list* %rotor_shift_result1029, %list** %rotor_two_in
  %ring_setting1030 = load %list*, %list** %ring_setting
  %get_at1031 = call i8* (%list*, i32, ...) @get_at(%list* %ring_setting1030, i32 1)
  %eltAsPtr1032 = bitcast i8* %get_at1031 to i32*
  %eltDeref1033 = load i32, i32* %eltAsPtr1032
  %rotor_two_out1034 = load %list*, %list** %rotor_two_out
  %character_location_result1035 = call i32 @character_location(%list* %rotor_two_out1034, i32 %eltDeref1033)
  store i32 %character_location_result1035, i32* %location_on_initialization_array
  %location_on_initialization_array1036 = load i32, i32* %location_on_initialization_array
  %rotor_two_out1037 = load %list*, %list** %rotor_two_out
  %rotor_shift_result1038 = call %list* @rotor_shift(%list* %rotor_two_out1037, i32 %location_on_initialization_array1036)
  store %list* %rotor_shift_result1038, %list** %rotor_two_out
  %key1039 = load %list*, %list** %key
  %get_at1040 = call i8* (%list*, i32, ...) @get_at(%list* %key1039, i32 2)
  %eltAsPtr1041 = bitcast i8* %get_at1040 to i32*
  %eltDeref1042 = load i32, i32* %eltAsPtr1041
  %rotor_three_in1043 = load %list*, %list** %rotor_three_in
  %character_location_result1044 = call i32 @character_location(%list* %rotor_three_in1043, i32 %eltDeref1042)
  store i32 %character_location_result1044, i32* %location_on_initialization_array
  %location_on_initialization_array1045 = load i32, i32* %location_on_initialization_array
  %rotor_three_in1046 = load %list*, %list** %rotor_three_in
  %rotor_shift_result1047 = call %list* @rotor_shift(%list* %rotor_three_in1046, i32 %location_on_initialization_array1045)
  store %list* %rotor_shift_result1047, %list** %rotor_three_in
  %ring_setting1048 = load %list*, %list** %ring_setting
  %get_at1049 = call i8* (%list*, i32, ...) @get_at(%list* %ring_setting1048, i32 2)
  %eltAsPtr1050 = bitcast i8* %get_at1049 to i32*
  %eltDeref1051 = load i32, i32* %eltAsPtr1050
  %rotor_three_out1052 = load %list*, %list** %rotor_three_out
  %character_location_result1053 = call i32 @character_location(%list* %rotor_three_out1052, i32 %eltDeref1051)
  store i32 %character_location_result1053, i32* %location_on_initialization_array
  %location_on_initialization_array1054 = load i32, i32* %location_on_initialization_array
  %rotor_three_out1055 = load %list*, %list** %rotor_three_out
  %rotor_shift_result1056 = call %list* @rotor_shift(%list* %rotor_three_out1055, i32 %location_on_initialization_array1054)
  store %list* %rotor_shift_result1056, %list** %rotor_three_out
  %input_text1057 = load %list*, %list** %input_text
  %rotor_three_out1058 = load %list*, %list** %rotor_three_out
  %rotor_three_in1059 = load %list*, %list** %rotor_three_in
  %rotor_two_out1060 = load %list*, %list** %rotor_two_out
  %rotor_two_in1061 = load %list*, %list** %rotor_two_in
  %rotor_one_out1062 = load %list*, %list** %rotor_one_out
  %rotor_one_in1063 = load %list*, %list** %rotor_one_in
  %encryption_decryption_result = call %list* @encryption_decryption(%list* %rotor_one_in1063, %list* %rotor_one_out1062, %list* %rotor_two_in1061, %list* %rotor_two_out1060, %list* %rotor_three_in1059, %list* %rotor_three_out1058, %list* %input_text1057)
  store %list* %encryption_decryption_result, %list** %temp
  %what_is_len1064 = load i32, i32* %what_is_len
  %printint = call i32 @printint(i32 %what_is_len1064)
  ret i32 0
}

define %list* @encryption_decryption(%list* %rotor_one_e_input, %list* %rotor_one_e_output, %list* %rotor_two_e_input, %list* %rotor_two_e_output, %list* %rotor_three_e_input, %list* %rotor_three_e_output, %list* %text) {
entry:
  %rotor_one_e_input1 = alloca %list*
  store %list* %rotor_one_e_input, %list** %rotor_one_e_input1
  %rotor_one_e_output2 = alloca %list*
  store %list* %rotor_one_e_output, %list** %rotor_one_e_output2
  %rotor_two_e_input3 = alloca %list*
  store %list* %rotor_two_e_input, %list** %rotor_two_e_input3
  %rotor_two_e_output4 = alloca %list*
  store %list* %rotor_two_e_output, %list** %rotor_two_e_output4
  %rotor_three_e_input5 = alloca %list*
  store %list* %rotor_three_e_input, %list** %rotor_three_e_input5
  %rotor_three_e_output6 = alloca %list*
  store %list* %rotor_three_e_output, %list** %rotor_three_e_output6
  %text7 = alloca %list*
  store %list* %text, %list** %text7
  %rotor_one_e_input8 = load %list*, %list** %rotor_one_e_input1
  ret %list* %rotor_one_e_input8
}

define %list* @rotor_shift(%list* %rotor_input, i32 %position) {
entry:
  %rotor_input1 = alloca %list*
  store %list* %rotor_input, %list** %rotor_input1
  %position2 = alloca i32
  store i32 %position, i32* %position2
  %character_holder = alloca i32
  %k = alloca i32
  %l = alloca i32
  %m = alloca i32
  %rotor_input3 = load %list*, %list** %rotor_input1
  %get_at = call i8* (%list*, i32, ...) @get_at(%list* %rotor_input3, i32 0)
  %eltAsPtr = bitcast i8* %get_at to i32*
  %eltDeref = load i32, i32* %eltAsPtr
  store i32 %eltDeref, i32* %character_holder
  store i32 0, i32* %k
  store i32 0, i32* %l
  store i32 0, i32* %m
  store i32 0, i32* %k
  br label %while

while:                                            ; preds = %merge33, %entry
  %k36 = load i32, i32* %k
  %position37 = load i32, i32* %position2
  %tmp38 = icmp slt i32 %k36, %position37
  br i1 %tmp38, label %while_body, label %merge39

while_body:                                       ; preds = %while
  %rotor_input4 = load %list*, %list** %rotor_input1
  %get_at5 = call i8* (%list*, i32, ...) @get_at(%list* %rotor_input4, i32 0)
  %eltAsPtr6 = bitcast i8* %get_at5 to i32*
  %eltDeref7 = load i32, i32* %eltAsPtr6
  store i32 %eltDeref7, i32* %character_holder
  store i32 0, i32* %l
  br label %while8

while8:                                           ; preds = %merge, %while_body
  %l31 = load i32, i32* %l
  %tmp32 = icmp slt i32 %l31, 25
  br i1 %tmp32, label %while_body9, label %merge33

while_body9:                                      ; preds = %while8
  %l10 = load i32, i32* %l
  %tmp = add i32 %l10, 1
  store i32 %tmp, i32* %m
  %rotor_input11 = load %list*, %list** %rotor_input1
  %l12 = load i32, i32* %l
  %rotor_input13 = load %list*, %list** %rotor_input1
  %m14 = load i32, i32* %m
  %get_at15 = call i8* (%list*, i32, ...) @get_at(%list* %rotor_input13, i32 %m14)
  %eltAsPtr16 = bitcast i8* %get_at15 to i32*
  %eltDeref17 = load i32, i32* %eltAsPtr16
  %tmp18 = alloca i32*
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr = bitcast i8* %malloccall to i32*
  store i32* %tmpAddr, i32** %tmp18
  %tmpWithVal = load i32*, i32** %tmp18
  store i32 %eltDeref17, i32* %tmpWithVal
  %asChar = bitcast i32* %tmpWithVal to i8*
  %set_at = call %list* (%list*, i32, i8*, ...) @set_at(%list* %rotor_input11, i32 %l12, i8* %asChar)
  br label %if

if:                                               ; preds = %while_body9
  %l27 = load i32, i32* %l
  %tmp28 = icmp eq i32 %l27, 24
  br i1 %tmp28, label %if_body, label %merge

if_body:                                          ; preds = %if
  %rotor_input19 = load %list*, %list** %rotor_input1
  %character_holder20 = load i32, i32* %character_holder
  %tmp21 = alloca i32*
  %malloccall22 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmpAddr23 = bitcast i8* %malloccall22 to i32*
  store i32* %tmpAddr23, i32** %tmp21
  %tmpWithVal24 = load i32*, i32** %tmp21
  store i32 %character_holder20, i32* %tmpWithVal24
  %asChar25 = bitcast i32* %tmpWithVal24 to i8*
  %set_at26 = call %list* (%list*, i32, i8*, ...) @set_at(%list* %rotor_input19, i32 25, i8* %asChar25)
  br label %merge

merge:                                            ; preds = %if, %if_body
  %l29 = load i32, i32* %l
  %tmp30 = add i32 %l29, 1
  store i32 %tmp30, i32* %l
  br label %while8

merge33:                                          ; preds = %while8
  %k34 = load i32, i32* %k
  %tmp35 = add i32 %k34, 1
  store i32 %tmp35, i32* %k
  br label %while

merge39:                                          ; preds = %while
  %rotor_input40 = load %list*, %list** %rotor_input1
  ret %list* %rotor_input40
}

define i32 @character_location(%list* %x, i32 %y) {
entry:
  %x1 = alloca %list*
  store %list* %x, %list** %x1
  %y2 = alloca i32
  store i32 %y, i32* %y2
  %j = alloca i32
  %i = alloca i32
  store i32 0, i32* %j
  store i32 0, i32* %i
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %merge, %entry
  %i9 = load i32, i32* %i
  %tmp10 = icmp slt i32 %i9, 26
  br i1 %tmp10, label %while_body, label %merge11

while_body:                                       ; preds = %while
  br label %if

if:                                               ; preds = %while_body
  %x4 = load %list*, %list** %x1
  %i5 = load i32, i32* %i
  %get_at = call i8* (%list*, i32, ...) @get_at(%list* %x4, i32 %i5)
  %eltAsPtr = bitcast i8* %get_at to i32*
  %eltDeref = load i32, i32* %eltAsPtr
  %y6 = load i32, i32* %y2
  %tmp = icmp eq i32 %eltDeref, %y6
  br i1 %tmp, label %if_body, label %merge

if_body:                                          ; preds = %if
  %i3 = load i32, i32* %i
  ret i32 %i3

merge:                                            ; preds = %if
  %i7 = load i32, i32* %i
  %tmp8 = add i32 %i7, 1
  store i32 %tmp8, i32* %i
  br label %while

merge11:                                          ; preds = %while
  %j12 = load i32, i32* %j
  ret i32 %j12
}

declare noalias i8* @malloc(i32)
