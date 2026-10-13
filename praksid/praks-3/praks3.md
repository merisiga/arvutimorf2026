# teema: xfst

Sümbolite teisendamine: suurtähed väikseks (ka arvestades konteksti);
muundurite kombineerimine

lihtne asendus

```bash
a -> b
a <- b
```

lihtne võimalik asendus

```bash
a (->) b
a (<-) b
```

a ja b võivad olla sümboljadad

tingimused

kontekstis V ja P, kusjuures V ja P on a-poolel

```bash
a -> b || V _ P 
```

kontekstis V ja P, kusjuures V ja P on b-poolel

```bash
a -> b \/ V _ P 
```

kompositsioon  .o.

tekstifailist kasutades:

```bash
printf "source suureks1.xfscript\n\
        define fst\n\
        read regex @\"naide_fono2.hfst\" .o. fst\n\
        save naide_fono2_suureks1.hfst\n\
        quit\n" | hfst-xfst
```

```bash

printf "source suureks_kompositsiooniga.xfscript\n\
        define fst\n\
        read regex @\"naide_fono2.hfst\" .o. fst\n\
        save naide_fono2_suureks_kompositsiooniga.hfst\n\
        quit\n" | hfst-xfst
```

või hfst-xfst -sse sisestades


## Kodutöö: teha nii, et teie muundur aktsepteerib vigaselt kirjutatud sõnu

nt. sika saab analüüsiks siga+N+Sg+Nom

koffer kohver+N+Sg+Nom

sgia siga+N+Sg+Nom

s.t. kirjutage mõned reeglid ab -> cd (ja soovi korral pange nad sõltuma kontekstitingimusest)

saadud teisendaja siduda olemasoleva muunduriga kompositsiooni abil

 

