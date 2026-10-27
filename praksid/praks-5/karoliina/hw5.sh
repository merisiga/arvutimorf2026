#!/bin/sh

# paarissõnade muunduri tegemine

# nii esimene kui tagumine sõna on siin nii, et neil on nii sümbolite deklaratsioon kui kõik jätkuleksikonid eraldi failis

cat hw5_multichar.lexc hw5_esi.lexc hw5_jätkud.lexc > hw5_esi.tmp
cat hw5_multichar.lexc hw5_tagu.lexc hw5_jätkud.lexc > hw5_tagu.tmp

hfst-lexc hw5_esi.tmp > hw5_esi.hfst
hfst-lexc hw5_tagu.tmp > hw5_tagu.hfst

hfst-twolc hw5_fono.twolc > hw5_fono.compose.hfst

hfst-compose-intersect hw5_esi.hfst hw5_fono.compose.hfst > hw5_esi_fono2.hfst
hfst-compose-intersect hw5_tagu.hfst hw5_fono.compose.hfst > hw5_tagu_fono2.hfst

printf "source paari_filter.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"hw5_esi_fono2.hfst\" @\"hw5_tagu_fono2.hfst\"]\n\
        save hw5_paarissõnad.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings hw5_paarissõnad.hfst > hw5_paarissõnad.strings


