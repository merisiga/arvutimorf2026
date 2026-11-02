#!/bin/bash
# põhimuundur, tuletus, paarissõnad, arvsõnad
# Käivitamine: bash build.sh   (kaustas, kus on kõik failid)
set -e
 

# 1. Põhimuundur: lexc + twolc, tuletuse filter, analüsaator

hfst-lexc Ann.lexc -o Ann.hfst
hfst-twolc Ann.twolc -o Ann_fono.hfst
hfst-compose-intersect -1 Ann.hfst -2 Ann_fono.hfst -o Ann_gen_toor.hfst
 
# sobimatud tuletused välja filtreerida (blokeeri_tuletus.xfscript)
printf "source blokeeri_tuletus.xfscript\n\
        define filter\n\
        read regex filter .o. @\"Ann_gen_toor.hfst\"\n\
        save Ann_gen.hfst\n\
        quit\n" | hfst-xfst
 
# analüsaator: pinnakuju -> analüüs
hfst-invert Ann_gen.hfst -o Ann_ana.hfst
 
# veatalutlik analüsaator (Vead.xfscript + analüsaator)
printf "source Vead.xfscript\n\
        define fst\n\
        read regex fst .o. @\"Ann_ana.hfst\"\n\
        save Ann_veatalutlik.hfst\n\
        quit\n" | hfst-xfst
 
hfst-fst2strings Ann_gen.hfst > Ann.strings
 

# 2. Paarissõnad (nibin-nabin, pilla-palla)
# Kasutame samu käändetüüpe ja sümboleid, mis on Ann.lexc failis:
# võtame Ann.lexc-ist ära Root-lexiconi ja lisame asemele paaride Root-i.
awk '/^LEXICON Root/{skip=1;next} /^LEXICON /{skip=0} !skip' Ann.lexc > Ann_ilma_rootita.tmp
# sümbolid eraldi ja jätkuleksikonid eraldi, et Root oleks lexc failis esimene
awk '/^LEXICON /{exit} {print}' Ann_ilma_rootita.tmp > Ann_sumbolid.tmp
awk '/^LEXICON /{p=1} p' Ann_ilma_rootita.tmp > Ann_jatkud.tmp
cat Ann_sumbolid.tmp paaris_esi.lexc Ann_jatkud.tmp > paaris_esi.tmp
cat Ann_sumbolid.tmp paaris_tagu.lexc Ann_jatkud.tmp > paaris_tagu.tmp
 
hfst-lexc paaris_esi.tmp -o paaris_esi.hfst
hfst-lexc paaris_tagu.tmp -o paaris_tagu.hfst
 
# samad häälikureeglid (Ann_fono.hfst)
hfst-compose-intersect -1 paaris_esi.hfst -2 Ann_fono.hfst -o paaris_esi_fono.hfst
hfst-compose-intersect -1 paaris_tagu.hfst -2 Ann_fono.hfst -o paaris_tagu_fono.hfst
 
# esimene osa + sidekriips + tagumine osa, filter jätab alles õiged paarid
printf "source paari_filter.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"paaris_esi_fono.hfst\" \"-\" @\"paaris_tagu_fono.hfst\"]\n\
        save paarissonad.hfst\n\
        quit\n" | hfst-xfst
 
hfst-fst2strings paarissonad.hfst > paarissonad.strings
 

# 3. Arvsõnad (kakssada, kakskümmend, paarsada, paarkümmend)
# Sümbolid, semkäänded ja gi-liide tulevad Ann.lexc failist (Ann_ilma_rootita.tmp).
# Arvsõna lexc failides on ainult ebaregulaarsed tüved (kahe, saja, kümne).
cat Ann_sumbolid.tmp arv_esi.lexc Ann_jatkud.tmp > arv_esi.tmp
cat Ann_sumbolid.tmp arv_tagu.lexc Ann_jatkud.tmp > arv_tagu.tmp
 
hfst-lexc arv_esi.tmp -o arv_esi.hfst
hfst-lexc arv_tagu.tmp -o arv_tagu.hfst
 
# samad häälikureeglid (nt kümmendgi -> kümmendki)
hfst-compose-intersect -1 arv_esi.hfst -2 Ann_fono.hfst -o arv_esi_fono.hfst
hfst-compose-intersect -1 arv_tagu.hfst -2 Ann_fono.hfst -o arv_tagu_fono.hfst
 
# esimene pool + teine pool, filter jätab alles õiged käändekombinatsioonid
printf "source arv_filter.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"arv_esi_fono.hfst\" @\"arv_tagu_fono.hfst\"]\n\
        save arvsonad.hfst\n\
        quit\n" | hfst-xfst
 
hfst-fst2strings arvsonad.hfst > arvsonad.strings
 
# 4. Testid
hfst-lookup paarissonad.hfst < paar_test.txt
hfst-lookup arvsonad.hfst < arv_test.txt
 
