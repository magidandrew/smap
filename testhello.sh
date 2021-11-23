#!/bin/sh
# To test compiler on the input file hello.smap:
# 1. Run hello.smap through compiler to get llvm IR in hello.ll
./smap.native test/hello.smap > hello.ll;
# 2. Turn the LLVM into regular assembly in hello.S
llc -relocation-model=pic hello.ll > hello.s;  
# 3. Turn the assembly into a .exe file 
cc -o hello.exe hello.s printstr.o;
# 4. Run the program to check output
./hello.exe