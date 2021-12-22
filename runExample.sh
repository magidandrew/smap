#!/bin/sh

 basename=$(basename $1 .smap)
cat examples/stdlib/stdlib.smap >> withLib.smap; 
cat examples/$basename.smap >> withLib.smap


./smap.native withLib.smap > $basename.ll;
llc -relocation-model=pic $basename.ll > $basename.s;
cc -o $basename.exe $basename.s polymorphicPrint.o prob.o list.o testMakeStruct.o -lm -lncurses;
./$basename.exe

echo "\nremoving files (.ll, .s, .exe, withLib.smap)"
rm $basename.ll $basename.s $basename.exe withLib.smap