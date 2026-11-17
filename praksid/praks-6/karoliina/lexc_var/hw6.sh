#!/bin/sh

hfst-lexc hw6.lexc > hw6.hfst
hfst-twolc hw6.twolc > hw6_fono.compose.hfst

hfst-compose-intersect hw6.hfst hw6_fono.compose.hfst > hw6_fono2.hfst

printf "source hw6.xfscript\n\
        define fst\n\
        read regex fst .o. @\"hw6_fono2.hfst\"\n\
        save hw6_fono4.hfst\n\
        quit\n" | hfst-xfst

#hfst-fst2strings hw6_fono4.hfst > hw6.strings -c 2 -n 100
hfst-fst2strings hw6_fono4.hfst > hw6.strings -L 100

