praks8

# Sõnamallid oletamiseks

lexc sees saab defineerida häälikuklasse ja -malle.
Nende defineerimiseks on omaette jaotis faili alguses,
pärast jaotist ```Multichar_Symbols``` ja enne jaotist ```LEXICON Root```

(Jätku)leksikoni kirjes saab kasutada häälikuklassidest moodustatud malle.
Mall peab olema ümbritsetud nurksulgudega ```<``` ja ```>```

NB! ```<``` ja ```>``` vahel kehtivad xfst märgikirjutamise reeglid, mitte lexc reeglid!
Kasutada võib disjunktsiooni | ja konjunktsiooni &, samuti tärni ja plussmärki,
    aga ```<``` ja ```>``` vahel ei saa teha muunduritehteid nagu ```.o.``` või ```->``` 

Ligikaudne näidis on: 

```
Multichar_Symbols

Definitions

C = [ b|c|d|f|g|h|j|k|l|m|n|p|r|s|t|v ] ;
V = [ a|e|i|o|u|õ|ä|ö|ü ] ;
L = V | C ;

LEXICON Root

 Nimisonad ;
 Omadussonad ;
 Oletused ;

LEXICON Oletused

< C* V [V|C]* C "+N":0 "+Hypot":0 > tüüp_kapp ; ! või muu jätkuleksikon, mis sobib 1-silbilise kaashäälikulõpulise sõna lõppude kirjeldamiseks
< L+ L {lik} "+A":0 "+Hypot":0 > tüüp_õnnelik ; 
```

## Koduülesanne

Lisada oma muundurile vähemalt 5 produktiivse muuttüübi malli.
Tulemuseks on muundur, mis ka mingite leksikonist puuduvate sõnade puhul ütleb, milline oleks nende käänamiviis.
Seda muundurit teistpidi kasutades on võimalik öelda, mis oleks tundmatu sõna algvorm.

Seejuures tuleks kontrollida, kas twolc reeglid endiselt töötavad.

Oleks hea, kui uued mallid oleksid kooskõlas ka tuletiste ja liitsõnamoodustusega

Eesti keele produktiivsete muuttüüpide mallide kohta vt loeng1 slaidi nr 17; nimisõnad käänduvad produktiivsete mallide järgi (v.a. muutüüp 7 Toomas). Muuttübi numbrid sellel slaidil on samad mis uuemates ÕS-ides. Guugelda ```ÕS muuttüübid```

 

