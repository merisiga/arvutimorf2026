#!/bin/sh

hfst-lexc hw4.lexc > hw4.hfst
hfst-twolc hw4_fono.twolc > hw4_fono.compose.hfst

hfst-compose-intersect hw4.hfst hw4_fono.compose.hfst > hw4_fono2.hfst

printf "source hw4.xfscript\n\
        define fst\n\
        read regex fst .o. @\"hw4_fono2.hfst\"\n\
        save hw4_fono4.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings hw4_fono4.hfst > hw4_fono4.strings

