#!/bin/sh

 basename=$(basename $1 .smap)

./smap.native $1 > $basename.ll;
llc -relocation-model=pic $basename.ll > $basename.s;
cc -o $basename.exe $basename.s polymorphicPrint.o prob.o list.o testMakeStruct.o -lm -lncurses;
./$basename.exe

echo "\nremoving files (.ll, .s, .exe)"
rm $basename.ll $basename.s $basename.exe