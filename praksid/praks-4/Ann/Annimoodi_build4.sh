#!/bin/sh

# algne hfst-lexc naide4.lexc > naide4.hfst
hfst-lexc Ann.lexc > Ann.hfst
# algne hfst-twolc fono2.twolc > fono2.compose.hfst
hfst-twolc Ann.twolc > Ann_fono.hfst

# algne hfst-compose-intersect naide4.hfst fono2.compose.hfst > naide4_fono2.hfst
hfst-compose-intersect Ann.hfst Ann_fono.hfst > Ann_gen_toor.hfst

printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"Ann_gen_toor.hfst\"\n\
        save Ann_gen.hfst\n\
        quit\n" | hfst-xfst

# algne hfst-fst2strings naide4_fono2_skript4.hfst > naide4_fono2_skript4.strings
hfst-fst2strings Ann_gen.hfst > Ann_gen.strings


 

