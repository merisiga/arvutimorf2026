# Kava

* Sättida paika muundurite tegemise ja kasutamise tarkvara
* Sättida paika GITHUBi repo
* Näidisfailid
* Kodutöö

## Muundurite tegemise ja kasutamise tarkvara

### Windows

1 WSLi installimine Windows'i

1.0 Kontrolli, kas virtualiseerimine (VT-x / AMD-V) on BIOS-is sisse lülitatud

1.0.1 Tegurmirea otsinguiaknasse  kirjuta "cmd" ja avanenud aknas vali "Ava" ja kirjuta käsureale

```cmdline
systeminfo
```

1.0.2 Keri tulemuste lõppu, kus on sektsioon Hyper-V Requirements,
kui Virtualization Enabled In Firmware näitab Yes, on virtualiseerimine BIOS-is lubatud.
Kui virtualiseerimine on keelatud (disabled), pead virtualiseerimise BIOS-is sisse lülitama.

1.0.2.1 Taaskäivita arvuti ja mine BIOS/UEFI seadistustesse (tavaliselt tuleb arvuti käivitumisel
vajutada klahvi F2, Del, F10 või Esc sõltvuvalt arvuti brändist).

1.0.2.2 Otsi protsessori seadetest (Advanced, CPU Configuration või Virtualization):

1.0.2.2.1 Intel protsessoritel: Intel Virtualization Technology, Intel VT-x või VTx

1.0.2.2.2 AMD protsessoritel: AMD-V, SVM Mode või Secure Virtual Machine

1.0.2.2.3 Muuda väärtuseks Enabled, salvesta muutused (Save and Exit, tavaliselt F10) ja taaskäivita arvuti1.

1.1 Ava käsurida administraatorina. Tegumirea otsingiuaknasse kirjuta "cmd" ja avanenud aknast
vali "Käivita administraatorina" ja kirjuta käsureale

```cmdline
wsl --install
```

Kui küsitakse linuxi kasutajanime ja parooli on kõige lihtsam on kasutada sama kasutajanime ja parooli mida kasutate Windowsis.
Kui siinkohal küsiti kasutajanime ja parooli mine kohe sammu 2.1 juurde.

Vastasel juhul tee arvutile reboot ja kui arvuti on uuesti üles tulnud ja mõne aja jooksul ei avane aken kus küsitakse Linuxi
kasutajanime ja parooli siis käivita windowsi CMD administraatorina  ning sisesta terminali aknas käsk.

```cmdline
wsl --install -d ubuntu 
```

1.3 Nüüd peaks teil olema lahti terminali aken kus küsitakse linuxi kasutajanime ja parooli.
Kõige lihtsam on kasutada sama kasutajanime ja parooli mida kasutate Windowsis

2 Vajalike programmide installlimine Ubuntu aknas

2.1 Uuendame Linuxi uusima tarkvara peale. Tegumirea otsinguaknasse sisestage "ubuntu" ja käivitage ubuntu
sisestage käsureale

```bash
sudo apt-get update && sudo apt full-upgrade -y
```

2.2 Installime HFST

```bash
sudo apt install hfst -y
```

2.3 Installime dot graafide joonistamise tarkvara

```bash
sudo apt install graphviz -y
```

2.4 Installime tekstiredaktori

```bash
sudo apt install gedit -y
```

2.5 Installime mugavama terminaliprogrammi

```bash
sudo apt install tilix -y
```

Sisestame tegumirea otsinguaknasse "tilix" ja linnuta "Kinnita avakuvavaatesse" ja "Kinnita tegumireale".

Edaspidi ava linuxi terminaliaken tegumirealt "tilix"i ikooniga.

2.6 Installime GITi

Ma teen Teid merisiga/arvutimorf2026 kaastöötajateks.
Selleks peab kaastöötajal olema githubi konto.
Kui seda pole, siis peate selle endale tegema.

2.6.1 Et saaksit turvaliselt githubi repoga askeldada, peate looma ssh (privaatse ja avaliku) võtmepaari.

```bash
ssh-keygen -C "github kasutamiseks"
```

* Salvesta vaikimisi pakutud asukohta.
* Parooli küsimise peale ära vajuta `<return>`, vaid sisesta parool,
võib olla seesama mida kasutate Windowsi logimiseks

2.6.2 SSH võtme paigaldamine GITHUBi veebilehel

* Logige [GITHUBi veebilehel](https://github.com/) kontole
* Klõpsa veebilehe paremas ülemises nurgas kasutajaokonto ikoonil → Settings → SSH and GPG keys → New SSH key.
* Anna võtmele mingi nimi (**Title**)
* Kopeeri oma faili `id_ed25519.pub` sisu **Key** aknasse (**Key type** olgu Authentication Key) selleks 
kopeeri terminaliknast oma võti

```bash
cat ~/.ssh/id_ed25519.pub
```

ja aseta veebilehel "Key" väljale


2.6.3 Nüüd peakski kõik olema tehtud ja mina saan kaastöötaja lisada repole merisiga/arvutimorf2026.

3 Giti kasutamine linuxi terminaliaknas

3.1 Enne esimest kasutamist öelge GITile käsurealt oma nimi ja meiliaadress

```bash
git config --global user.email "õige@meili.aadress"
git config --global user.name "õige nimi"
git config --global core.quotePath false
```

3.2 GITi igapäevane kasutamine

Kui GITi käsu peale küsitakse parooli, sisestage oma ssh-võtmele pandud parool

3.2.1 Repo kloonimiseks GITHUBi veebilehelt endale sobivalt valitud kataloogi

```bash
git clone git@github.com:merisiga/arvutimorf2026.git sobiv_kataloog
```

3.2.2 Tavaline tööprotsess (oma kataloogis) on järgmine:

* Enne millegi tegemist

```bash
git pull
```

* Siis teha muutused failidesse, uued failid, kataloogid vms.
Et näha, mis on lõpuks tehtud:

```bash
git status
```

* Et panna oma tehtu reposse:

```bash
git add muutunud_fail
git commit -m "märkus selle kohta, mis on tehtud"
git push
```

Kuidas oma faile nimetada? Vaata soovitusi jaotises **Koduülesanne**

## Näidisfailid

kalajt.lexc - slaididelt nähtud pisileksikoni esitus

naide1.lexc - pisinäide käändkondade esitamisest

... on lexc-tüüpi; lexc on mõeldud leksikonide kirjeldamiseks, s.t. vastab sõnastikutegija intuitsioonile; on mugav aglutinatiivse morfotaktika kirjeldamiseks, kusjuures muutetunnused on sõna lõpus

faili struktuur:

```bash
Multichar\_Symbols   <-- pole kohustuslik jaotis, aga tegelikult ilma selleta ei saa (sest mitmetähelisi sümboleid/märke on praktiliselt vaja)
    
LEXICON Root                    ! <-- kohustuslik; see on muunduri algus

lexikaalne:pindesitus edasi1 ;  ! <-- leksikoni kirje, mis viitab ka stringipaari jätkamisele

LEXICON edasi1                  ! <-- jätkuklass, s.t. leksikon, millele viidatakse Root seest

lexikaalne:pindesitus edasi2 ; 

lexikaalne:pindesitus # ;       ! <-- leksikoni kirje; stringipaari lõpp

LEXICON edasi2                  ! <-- jätkuklass, s.t. leksikon, millele viidatakse edasi1 seest

lexikaalne:pindesitus # ;
```

\--------

erimärgid

!   kommentaari algus; kommentaar kestab rea lõpuni

;   kirje lõpp

\#   sõnavormi lõpp, s.t. ei jätku mingi jätkuleksikoniga

:   muunduri ülemise ja alumise poole eristaja


\----------


muunduri tegemiseks:

```bash
hfst-lexc naide1.lexc > naide1.fst
```

muunduri vaatamiseks (kui muunduris pole tsükleid):

```bash
cat naide1.fst | hfst-fst2strings
```

fst tabelina:

```bash
cat naide1.fst | hfst-fst2txt
```

graafi joonistamiseks on vaja tabel teisendada dot-i jaoks sobivale kujule; 

fst graafina:

```bash
cat kalajt.lexc | hfst-lexc | hfst-fst2txt  | python3 att2dot.py | sed 's/@0@/ε/' | dot -Tpng -o kalajt.png
```

muunduri ülemise ja alumise poole ära vahetamiseks

```bash
hfst-invert < naide1.fst > naide1.ifst

echo 'torssis+A' | hfst-lookup naide1.fst

echo 'torssis' | hfst-lookup naide1.ifst

echo 'torssis' | hfst-flookup naide1.fst
```

## 4. Koduülesanne

Igaüks teeb repos praks-1 kataloogi alla oma eesnimega alamkataloogi; sinna paneb ta oma kodutööna tehtud ja kompileeritud failid (ja tekstifailina omapoolsed kommentaarid, kui neid on).

Igaüks teeb lexc faili, milles on vähemalt neli sõna: eesnimi perenimi linn tänav; need võivad olla teie oma nimed ja elukohad/lemmikkohad, aga ei pruugi.

Igale sõnale on olemas täisparadigma, s.t. nii ainsus kui mitmus, mõlemas 14 käänet. Proovige valida sõnu muudes muuttüüpides kui praksinäited või kirjeldada muuttüüpe teisiti kui praksinäidetes.  


mida tähele panna:

- jätkuklasse saab määratleda mitmel eri moel
- mõne sõna käänamine on tülikalt kirjeldatav; sel juhul võib jätta käänamise osaliselt valeks ja kirjeldada, milles probleem ning miks on osaliselt vale

\----------------------------

järgmises praksis kommenteerin tehtud kodutöid

\----------------------------


oma lexc fail nimetada järgmiselt: **mingiomanimi.lexc**

kompileeritud fail olgu **mingiomanimi.hfst**

testfail olgu **mingiomanimi.test**

testimiseks käsk:

```bash
cat mingiomanimi.test | hfst-lookup mingiomanimi.hfst
```



