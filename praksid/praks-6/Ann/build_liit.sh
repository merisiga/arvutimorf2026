#!/bin/bash
# Liitsõnamuundur kahel viisil: 1) xfst skriptiga, 2) lexc abil.
# Käivitamine: bash build_liit.sh

set -e

# 0. lihtsõnamuundur (lexc) ja häälikureeglid (twolc)
hfst-lexc Ann.lexc -o Ann.hfst
hfst-twolc Ann.twolc -o Ann_fono.hfst

############################################################
# Võimalus 1: xfst
#   lihtsona -> piiratum (filter) -> [piiratum %#]* lihtsona -> filter -> häälikureeglid
############################################################
printf "source liit_filter.xfscript\n\
        define filter\n\
        source liitsona_xfst.xfscript\n\
        define liitsonad\n\
        read regex filter .o. liitsonad\n\
        save Ann_liit_xfst_toor.hfst\n\
        quit\n" | hfst-xfst
hfst-compose-intersect -1 Ann_liit_xfst_toor.hfst -2 Ann_fono.hfst -o Ann_liit_xfst.hfst

############################################################
# Võimalus 2: lexc
#   sõnarühmad ja liitsõna piir lexc failis -> filter -> häälikureeglid
############################################################
hfst-lexc Ann_liit.lexc -o Ann_liit_lexc_toor.hfst
printf "source liit_filter.xfscript\n\
        define filter\n\
        read regex filter .o. @\"Ann_liit_lexc_toor.hfst\"\n\
        save Ann_liit_lexc_filtr.hfst\n\
        quit\n" | hfst-xfst
hfst-compose-intersect -1 Ann_liit_lexc_filtr.hfst -2 Ann_fono.hfst -o Ann_liit_lexc.hfst

############################################################
# Võrdlus: kas mõlemad muundurid teevad sama?
############################################################
# a) samad testsisendid mõlemale
hfst-lookup Ann_liit_xfst.hfst < liit_test.txt > liit_xfst.out 2> /dev/null
hfst-lookup Ann_liit_lexc.hfst < liit_test.txt > liit_lexc.out 2> /dev/null
diff liit_xfst.out liit_lexc.out && echo "Testsisendite tulemused on ühesugused" || echo "Tulemused erinevad!"
cat liit_xfst.out

# b) kogu muunduri võrdlus
hfst-compare Ann_liit_xfst.hfst Ann_liit_lexc.hfst || true

