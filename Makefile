# "ocamlbuild calc.native" will also build the calculator

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
	rm -rf *.cmi *.cmo parser.ml parser.mli scanner.ml calc.out calc
