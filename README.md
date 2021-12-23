  

  

# PLT - smap

  

  

To test compiler:  

    make clean
    
    make all
    
    ./testall.sh

  
To test compiler with a single file:

    ./testfile.sh <filePath>

To test compiler *and keep intermediate files*:

   

    make clean
    
    make all
    
    ./testall.sh -k

   To run example smap programs:
   

    ./runExample.sh <exampleProgramName>

## Hello World Milestone


Currently our test input file is test-hello.smap in the test folder.

  

### Compiler Structure Overview

smap.ml is the front end of our compiler.

1. It sucks in test-hello.smap,


2. runs it through the scanner (producing tokens),

  

  

3. runs output of scanner through parser (producing AST),

  

  

4. runs output of parser through semantic analyzer (producing SAST),

  

  

5. runs output of semantic analyzer through code generator (producing LLVM),

  

  

6. finally, runs output of codegenerator through LLVM compiler to produce a test-hello.smap.exe file.

  

  

#### Files Corresponding to each part

  

  

1. Scanner: scanner.mll

  

  

2. Parser: parser.mly, ast.ml

  

  

4. Semantic Analyzer: semant.ml, sast.ml

  

  

5. Code Generator: codegen.ml
