# teema: häälikuteisendused, õigemini täheteisendused

näited:
mitm os sõnadel redel ja vidin on justkui sarnane, v.a. redel i -> e:

redel+i+id --> redel+e+id

vidin+a+id --> vidin+a+id

sugu+Sg+Gen = soo  --> kuidas seda muutust kajastada?

sugu nõrgas astmes --> g kaob e. muutub 0-ks;

u kõrvalt on g katunud (s.t. seal on nüüd 0) --> u madaldub o-ks

(vokaalide kohta vt https://et.wikipedia.org/wiki/T%C3%A4ish%C3%A4%C3%A4lik, https://en.wikipedia.org/wiki/IPA_vowel_chart_with_audio)

lahendus:
morfotaktika + morfofonoloogia, s.t.
lexc + twolc

twolc on alternatiivne viis esitada muundureid

twolc kirjeldus (lk 14 jne, eriti 18, 19): 

https://kodu.ut.ee/~hkaalep/arvutimorf_24/twolc.pdf 
https://cl.indiana.edu/~ftyers/courses/2024/Spring/L-545/materials/twolc.pdf

1) twolc formalism eeldab, et sisend ja väljund on võrdse pikkusega; mõlemas võib olla kuitahes palju nulle, et pikkused võrdsed saaksid
2) twolc reegel näeb nii sisendit kui väljundit
3) twolc reeglid töötavad kõik samaaegselt, s.t. ei ole nii, et ühe reegli väljund on teise sisendiks; 
kui reeglid on omavahel konfliktis, siis neid siluda on raske (reeglite konflikt tähendab, et nende poolt määratav muundur on veider)

-------------

```bash
# tee lexc and twolc automaadid:
hfst-lexc naide2.lexc > naide2.hfst
hfst-twolc fono2.twolc > fono2.compose.hfst

# tee sünteesiautomaat (e. genereerimisautomaat)
hfst-compose-intersect naide2.hfst fono2.compose.hfst > naide_fono2.hfst

# vaata, mis seal sees on
# hfst-fst2strings naide_fono2.hfst | less

# täpsemaks testimiseks, et kas twolc reeglid teevad seda, mida vaja:
# 1. leia leksikaalsele väljendile vastav pindesituse pool:
echo 'sugu+N+Sg+Gen' | hfst-lookup naide2.hfst
> sugu+N+Sg+Gen	suG1u{NA}	0,000000

# 2. vaata, kas täheteisendused on need, mids nad peaksid olema; NB! tähepaaride vahel peab olema tühik!
echo 's u:o G1:0 u:o {NA}:0' | hfst-pair-test fono2.compose.hfst
```
--------------

## kodutöö

mistahes sõna lõpus võib olla gi/ki liide
1. muuta oma lexc faili, nii et mistahes sõnavorm võib (ehkki ei pruugi) lõppeda gi või ki-ga;

    ... ja lisaks kirjutada 2-tasemeline reegel, mis helitu hääliku (g b d k p t s š h f) järel muudab gi ki-ks 

2. lisada kaks nõrgeneva astmevaheldusega sõna oma lexc faili, kusjuures astmevaheldus hõlmab sulghäälikuid

   2.1. kk pp tt -> k p t 

   2.2. k p t -> g b d 

   ... ja lisaks kirjutada nõrgeneva astmevahelduse 2-tasemelised reeglid 

3. lisada ülejäänud kõrge täishääliku madaldumise reeglid konsonandi kao puhul (i u ü -> e o ö) ja lisada i->e ning ü->ö muutusi esindavad näidissõnad oma lexc faili

