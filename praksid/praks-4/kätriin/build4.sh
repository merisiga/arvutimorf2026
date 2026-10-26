#!/bin/sh

hfst-lexc kodut2.lexc > kodut.hfst
hfst-twolc kodut2.twolc > kodut_twolc.compose.hfst

hfst-compose-intersect kodut.hfst kodut_twolc.compose.hfst > naide4.hfst

printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"naide4.hfst\"\n\
        save naide4_skript4.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings naide4_skript4.hfst > naide4_skript4.strings


 

