CC = cc
CFLAGS = -g -Wall

.PHONY : dune
dune:
	 dune build src/smap.exe

.PHONY : dunehello
dunehello :
	 dune exec src/smap.exe test/hello.smap
# calc : parser.cmo scanner.cmo calc.cmo
# 	ocamlc -w A -o calc $^

parser : parser.cmo scanner.cmo

%.cmo : %.ml
	ocamlc -w A -c $<

%.cmi : %.mli
	ocamlc -w A -c $<

scanner.ml : scanner.mll
	ocamllex $^

parser.ml parser.mli : parser.mly
	ocamlyacc $^

# Depedencies from ocamldep
# calc.cmo : scanner.cmo parser.cmi ast.cmi
# calc.cmx : scanner.cmx parser.cmx ast.cmi
parser.cmo : ast.cmi parser.cmi
parser.cmx : ast.cmi parser.cmi
scanner.cmo : parser.cmi
scanner.cmx : parser.cmx


##############################

.PHONY : clean
clean :
	rm -rf *.cmi *.cmo parser.ml parser.mli scanner.ml calc.out calc *.o *.dSYM; make clean2

.PHONY : smap
smap : smap.native

# Everything below the line was copied from the microc makefile
# I changed the make clean rule to a make clean2 rule
# so it wouldn't clash with our current make clean rule
# I also changed the microc.native rule to be smap.native

############### microc makefile stuff ########################################

# "make test" Compiles everything and runs the regression tests
.PHONY : testhello
testhello :
	 ./testhello.sh

.PHONY : test
test : all testall.sh
	./testall.sh

# "make all" builds the executable as well as the "printbig" library designed
# to test linking external code

.PHONY : all
all : smap.native prob.o list.o testMakeStruct.o polymorphicPrint.o c_deps

# "make microc.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

smap.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind src/smap.native

# "make clean" removes all generated files

.PHONY : clean2
clean2 :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff

c_deps: list.o prob.o

c_tests: prob list

# Testing the "printbig" example
list.o:
	$(CC) $(CFLAGS) -c -o list.o runtime/list.c

list: list.o runtime/list.c
	$(CC) $(CFLAGS) -o list -DBUILD_TEST runtime/list.c

prob.o:
	$(CC) $(CFLAGS) -c -o prob.o runtime/prob.c -lm

prob: list.o runtime/prob.c
	$(CC) $(CFLAGS) list.o -o prob -DBUILD_TEST runtime/prob.c -lm

printbig : printbig.c
	cc -o printbig -DBUILD_TEST printbig.c

polymorphicPrint.o :
	cc -c -o polymorphicPrint.o runtime/polymorphicPrint.c

testMakeStruct.o :
	cc -c -o testMakeStruct.o runtime/testMakeStruct.c

# Building the tarball

TESTS = \
  add1 arith1 arith2 arith3 fib float1 float2 float3 for1 for2 func1 \
  func2 func3 func4 func5 func6 func7 func8 func9 gcd2 gcd global1 \
  global2 global3 hello if1 if2 if3 if4 if5 if6 local1 local2 ops1 \
  ops2 printbig var1 var2 while1 while2

FAILS = \
  assign1 assign2 assign3 dead1 dead2 expr1 expr2 expr3 float1 float2 \
  for1 for2 for3 for4 for5 func1 func2 func3 func4 func5 func6 func7 \
  func8 func9 global1 global2 if1 if2 if3 nomain printbig printb print \
  return1 return2 while1 while2

TESTFILES = $(TESTS:%=test-%.mc) $(TESTS:%=test-%.out) \
	    $(FAILS:%=fail-%.mc) $(FAILS:%=fail-%.err)

TARFILES = ast.ml sast.ml codegen.ml Makefile _tags smap.ml microcparse.mly \
	README scanner.mll semant.ml testall.sh \
	printbig.c arcade-font.pbm font2c \
	Dockerfile \
	$(TESTFILES:%=tests/%)

microc.tar.gz : $(TARFILES)
	cd .. && tar czf microc/microc.tar.gz \
		$(TARFILES:%=microc/%)
