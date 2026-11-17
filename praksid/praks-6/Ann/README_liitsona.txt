Ann - liitsõnamoodustus
 
Kasutasin oma algset 10-sõnalist leksikoni. Ilmselgelt pole kõige parem, aga ma ei tahtnud hetkel juurde lisada.
(Ann, Salutee, Ilmatsalu, Tartu, koli, kena, sugu, vidin, redel, torssis).
 
Failid:
Ann.lexc, Ann.twolc        lihtsõnamuundur ja häälikureeglid (twolc-i Alphabet'isse lisasin %#:0)
liitsona_xfst.xfscript     võimalus 1: liitsõnamuundur xfst-is
Ann_liit.lexc              võimalus 2: sama lexc-is (sõnarühmad ja liitsõna piir)
liit_filter.xfscript       filter, mida kasutavad mõlemad võimalused
liit_test.txt              testsisendid
build_liit.sh              käsud, millega kõik valmis tehakse ja võrreldakse
 
Võimalus 1 (xfst), liitsona_xfst.xfscript:
1. Lihtsõnamuundur on lexc-ist tehtud Ann.hfst, piiratud algsele 10 sõnale. Tuletus on lubatud.
2. Piiratum muundur on lihtsõnamuundur, millele on pandud filter: ainult nimi- ja omadussõnad,
   ainult ainsuse nimetav, ainsuse omastav ja mitmuse omastav, gi-liidet ei ole.
3. Liitsõnamuundur: [[piiratum %#]* lihtsona], s.t. null kuni lõpmatu arv esiosi ja siis lihtsõna.
4. liit_filter.xfscript blokeerib sobimatud tuletised (nagu varem blokeeri_tuletus.xfscript), aga nii, et
   see toimiks ka liitsõna keskel (pärisnimed, pikk/kõva, kenamam, kolim jne).
5. Häälikureeglid (Ann_fono.hfst) tulevad alles pärast liitmist, et astmevaheldus töötaks ka liitsõnas.
 
Võimalus 2 (lexc), Ann_liit.lexc:
1. Sõnad on rühmades: LEXICON Nimisonad ja LEXICON Omadussonad. Root ja Sonad viitavad mõlemale.
2. Uus lexicon GI_VOI_OSA on kõigi vormide lõpus, mis võivad olla liitsõna esiosa
   (ainsuse nimetav, ainsuse omastav ja mitmuse omastav): gi-liide, lõpp või liitsõna piir %# ja siis Sonad.
3. %# on Multichar_Symbols alla deklareeritud. Twolc-is on %#:0, et piir pinnal ei paistaks.
4. Sama filter (liit_filter.xfscript) ja samad häälikureeglid nagu võimalusel 1.
 
Võrdlemine:
- build_liit.sh jooksutab samad testsisendid mõlemal muunduril ja võrdleb tulemusi (diff).
- hfst-compare võrdleb kogu muundurit.
 
Kumb meetod on parem ja meeldivam:
Mulle meeldib ilmselt xfst-i variant rohkem. Selles jääb Ann.lexc puutumata ja liitsõnareeglid olid ühes lühikeses failis, nii et neid on lihtne muuta. Lexc-i variandis peab igale käändetüübile lisama jätkuleksikoni ja sõnad rühmadesse jaotama.
 
