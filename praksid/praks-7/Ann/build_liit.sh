#!/bin/bash
# Liitsõnamuundur kahel viisil: 1) xfst skriptiga, 2) lexc abil.
# Käivitamine: bash build_liit.sh
# Vajab: Ann.lexc, Ann.twolc (Alphabet'is peab olema %#:0), Ann_liit.lexc, blokeeri_tuletus.xfscript,
#        liit_filter.xfscript, liitsona_xfst.xfscript, liit_test.txt
set -e

############################################################
# 0. Lihtsõnamuundur (kõik Ann.lexc sõnad, häälikureeglid juba sees)
#    Ann.lexc + Ann.twolc -> Ann_gen_toor.hfst -> tuletusfilter -> Ann_gen.hfst
############################################################
hfst-lexc Ann.lexc -o Ann.hfst
hfst-twolc Ann.twolc -o Ann_fono.hfst
hfst-compose-intersect -1 Ann.hfst -2 Ann_fono.hfst -o Ann_gen_toor.hfst

printf "source blokeeri_tuletus.xfscript\n\
        define filter\n\
        read regex filter .o. @\"Ann_gen_toor.hfst\"\n\
        save Ann_gen.hfst\n\
        quit\n" | hfst-xfst

############################################################
# Võimalus 1: xfst
#   lihtsona (Ann_gen.hfst) -> piiratum (filter) -> [piiratum %#:0]* lihtsona -> liitsõnafilter
############################################################
printf "source liit_filter.xfscript\n\
        define filter\n\
        source liitsona_xfst.xfscript\n\
        define liitsonad\n\
        read regex filter .o. liitsonad\n\
        save Ann_liit_xfst.hfst\n\
        quit\n" | hfst-xfst

############################################################
# Võimalus 2: lexc
#   sõnarühmad ja liitsõna piir lexc failis -> liitsõnafilter -> häälikureeglid
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
# a) testsisendid mõlemal muunduril (tulemused terminali)
hfst-lookup Ann_liit_xfst.hfst < liit_test.txt
hfst-lookup Ann_liit_lexc.hfst < liit_test.txt

# b) kogu muunduri võrdlus
hfst-compare Ann_liit_xfst.hfst Ann_liit_lexc.hfst || true

# c) kõigi stringide võrdlus (hfst-fst2strings) on jäetud välja: liitsõnade hulk on lõpmatu ja
#    -c 1 jäi seisma, -L 12 andis vaid mõne rea. Kogu muundurite võrdluseks piisab hfst-compare'ist.
# timeout 300 hfst-fst2strings -c 1 Ann_liit_xfst.hfst | sort > liit_xfst.strings
# timeout 300 hfst-fst2strings -c 1 Ann_liit_lexc.hfst | sort > liit_lexc.strings
# diff -q liit_xfst.strings liit_lexc.strings
