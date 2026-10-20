#!/bin/sh

hfst-lexc naide4.lexc > naide4.hfst
hfst-twolc fono2.twolc > fono2.compose.hfst

hfst-compose-intersect naide4.hfst fono2.compose.hfst > naide4_fono2.hfst

printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"naide4_fono2.hfst\"\n\
        save naide4_fono2_skript4.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings naide4_fono2_skript4.hfst > naide4_fono2_skript4.strings


 

