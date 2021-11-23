
  

# PLT - smap

Building the compiler with dune:

    dune build src/smap.exe
Building compiler without dune:

  
    make clean
    make smap

To test compiler on the input file hello.smap:

    make clean
    make all
    ./testhello.sh

*To check parser is working:  
make clean    
make parser
Someday, to run tests:
./runtests.sh  
Someday, to run tests and keep intermediate files (like the .exe files produced):  
./runtests.sh -k*

#################################################

## Hello World Milestone

  

Currently our test input file is hello.smap in the test folder.

### Compiler Structure Overview

smap.ml is the front end of our compiler.

1. It sucks in hello.smap,

2. runs it through the scanner (producing tokens),

3. runs output of scanner through parser (producing AST),

4. runs output of parser through semantic analyzer (producing SAST),

5. runs output of semantic analyzer through code generator (producing LLVM),

6. finally, runs output of codegenerator through LLVM compiler to produce a hello.exe file.

#### Files Corresponding to each part

1. Scanner: scanner.mll

2. Parser: parser.mly, ast.ml

4. Semantic Analyzer: semant.ml, sast.ml

5. Code Generator: codegen.ml
