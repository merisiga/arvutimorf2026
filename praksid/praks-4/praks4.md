
# xfst

## Süntaks xfst puhul

Sümbolite vahel PEAB OLEMA tühik!
see on teisiti kui lexc puhul!

```[k a s s]``` ja ```[{kass}]``` on neli sümbolit; 
```[kass]``` on üks sümbol.
Hea stiil ühe sümboli kirjutamiseks:  ```%kass%```  või ```+kass``` või midagi muud, nii et tulemus paistaks selgelt teistsugune kui ```kass```


### Sümbol, string ja keel
```?``` tähistab suvalist sümbolit

```0``` tähistab tühistringi e. epsiloni

Sulud ```()```, pluss ```+``` ja Kleene-i tärn ```*``` on sama tähendusega mis regulaaravaldisteski.

```?*``` tähistab kõikvõimalikke stringe, k.a. tühistring

```\a``` tähendab mitte sümbol ```a```

```~a``` tähendab mitte hulk ```a```, s.t. ```[?* & ~a]```, s.t. ```[?* - a]```, s.t. kõik stringid, v.a. need, mis on hulgas ```a```

```a - b``` tähendab ```[a & ~b]```

# lexc

Probleem: tuletusliide liitub käändevormile, aga tuleks arvestada ka sõnaliiki.
Näiteks omadussõna kesk- ja ülivõrre, määrsõnatuletus ```-lt```

lexc failis võiksid need tuletised näha välja nii:
```bash
  +Der/m+A+Comp:%>m tüüp_vidin ;
    +Der/lt+Adv:%>lt # ;
```
ja asuda ainsuse omastavaga samas jätkuleksikonis, umbes nii (gi-liidet siin ei arvestata):
```bash
        +Sg+Gen: # ;
  +Der/m+A+Comp:%>m tüüp_vidin ;
    +Der/lt+Adv:%>lt # ;
```
... aga kuidas teha nii, et need liited liituksid ainult omadussõnale ?

vaata naide4.lexc           <-- nagu naide2.lexc, aga NB! lisatud mitmemärgilised sümbolid, mida tuletuses kasut.

## + filtrid (xfst)
blokeeri_tuletus.xfscript   <-- filtrid

build4.sh

NB! naide4.lexc on osaliselt puudulik/vigane! Ta ei võimalda luua sõnavormi ```kenamalt```, mis oleks tuletis sõnast ```kenam```

## Kodutöö

Lisada oma muundurisse tuletus: ```+Der/m```, ```+Der/lt```  (seejuures nii, et parandada ```naide4.lexc``` puudulikkus selle osas) ja lisaks ülivõrre  ```+Der/im```, ning omadussõna moodustamiseks nimisõnast ```+Der/lik```. ```lik``` käändub nagu ```pott```, kuid tüvevokaal on ```u``` (```koon```) ja ainsuse nimetavas ei kirjutata topelt kaashäälik.
S.t. muuta lexc faili ja teha enda jaoks õige xfscript fail, mis sobimatud välja filtreerib.

Üks asi, mida veel võiks välja filtreerida, on sobimatud sõnad oma tuletuse jaoks. 
Nt ```pikk``` keskvõrre on ```pikem```, mitte ```pikam``` nagu vaikimisi tuletusereegel annaks.

S.t umbes midagi sellist
```bash
define pahadsõnad [[{pikk} | {kõva}] "+A" ?*]
```
 



