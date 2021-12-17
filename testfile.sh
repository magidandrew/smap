#!/bin/sh

 basename=$(basename $1 .smap)

./smap.native $1 > $basename.ll;
llc -relocation-model=pic $basename.ll > $basename.s;
cc -o $basename.exe $basename.s printint.o;
./$basename.exe

echo "removing files (.ll, .s, .exe)"
rm $basename.ll $basename.s $basename.exe