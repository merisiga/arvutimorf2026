#!/bin/sh

# paarissõnade muunduri tegemine

# nii esimene kui tagumine sõna on siin nii, et neil on nii sümbolite deklaratsioon kui kõik jätkuleksikonid eraldi failis

cat praks5_multichar.lexc praks5_esi.lexc praks5_jätkud.lexc > praks5_esi.tmp
cat praks5_multichar.lexc kt5_tagu.lexc praks5_jätkud.lexc > praks5_tagu.tmp

hfst-lexc praks5_esi.tmp > praks5_esi.hfst
hfst-lexc kt5_tagu.tmp > praks5_tagu.hfst

hfst-twolc kt5.twolc > kt5.compose.hfst

hfst-compose-intersect praks5_esi.hfst kt5.compose.hfst > kt5_esi_fono.hfst
hfst-compose-intersect praks5_tagu.hfst kt5.compose.hfst > kt5_tagu_fono.hfst

printf "source paari_filter.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"kt5_esi_fono.hfst\" \"-\" @\"kt5_tagu_fono2.hfst\"]\n\
        save praks5_paarissõnad.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings praks5_paarissõnad.hfst > praks5_paarissõnad.strings


 

