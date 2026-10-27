teema filtrid:
# lexc

Probleem: sõna mõlemad osad käänduvad

```emb-kumb, emma-kumma , ...```

```üksainus, üheainsa, ühtainust/ühtainsat/ühteainust/ühteainsat```

```viiskümmend, viiekümne, ...```

Paarissõnad nagu

```kihin-kahin, kihina-kahina , ...```

Kuidas neid muundurina kajastada?

1. Tee igale sõnale muundur, mis kajastab käänamist (```kihin, kihina, kihinat, ... kahin, kahina, kahinat, ...```)
2. Pane paarissõnade muundurid üksteise järele, s.t. konkateneeri (mis oleks hea eestikeelne sõna?), 
   s.t. esimese muunduri lõppolekust minnakse teise algolekusse.
   Tulemuseks on muundur, kus esimese sõna mistahes vormile võib järgneda teise sõna mistahes vorm (nt ```kihinasse-kahinast```)
3. Jäta alles ainult need rajad, kus on õiged sõnad teineteise paarilistena ja seejuures veel õiges käändes
   (```kihin-kahin, kihina-kahina, ...```)

Vaata ```build5.sh```

## Kodutöö

Teha muundur, milles on vähemalt kaks sellist arvsõna, milles mõlemad pooled käänduvad,
nt. ```kakssada```, ```paarkümmend```

Siin on kolm probleemi: esiteks, kuidas täpselt käänata, s.t. võib-olla on oma intuitsioon ja kirjakeele norm omavahel vastuolus.
Teiseks, kuidas oma intuitsiooni kirja panna. Kolmandaks, kuidas on hea lexc ja twolc abil kirjeldada mõneti erandlikke sõnu nagu ```kümmend```, ```üks```, ```kaks``` jne

Ideid saab skriptist ```numeral-filter.est.xfscript``` ja ```wordpair-filter.est.xfscript```



 



