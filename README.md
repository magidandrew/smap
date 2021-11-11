# PLT - smap

To check parser is working:
make parser
make clean //make sure to do this make clean before checking the whole compiler!

To check the whole compiler:
make all
make clean

To run tests:
./runtests.sh
To run tests and keep intermediate files (like the .exe files produced):
 ./runtests.sh -k

#################################################
## Hello World Milestone

Currently our test input file is the micro's test-hello.mc file.
We can change the file extension to be specific for smap, but then we have to change rules in the makefile that look for *mc files, so for now I left the file extension alone.
### Compiler Structure Overview
smap.ml is the front end of our compiler.
1. It sucks in test-hello.mc, 
2. runs it through the scanner (producing tokens), 
3. runs output of scanner through parser (producing AST),
4. runs output of parser through semantic analyzer (producing SAST),
5. runs output of semantic analyzer through code generator (producing LLVM),
6. finally, runs output of codegenerator through LLVM compiler to produce a test-hello.exe file.
#### Files Corresponding to each part
1. Scanner: scanner.mll
2. Parser: parser.mly, ast.ml
4. Semantic Analyzer: semant.ml, sast.ml
5. Code Generator: codegen.ml


