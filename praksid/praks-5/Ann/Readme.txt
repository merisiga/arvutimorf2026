Ann - arvutimorfoloogia kodutööd

Failid:
Ann.lexc, Ann.twolc          põhimuundur (sõnad, käänded, tuletus, häälikureeglid)
blokeeri_tuletus.xfscript    tuletuse filter
Vead.xfscript                vigade parandamine
paaris_esi.lexc, paaris_tagu.lexc, paari_filter.xfscript    paarissõnad
arv_esi.lexc, arv_tagu.lexc, arv_filter.xfscript            arvsõnad
build.sh                     käsud, millega kõik muundurid valmis tehakse
Ann.strings, paarissonad.strings, arvsonad.strings           kõik analüüsid ja vormid
paar_test.txt, arv_test.txt  testsisendid

Käivitamine: bash build.sh


1. PAARISSÕNAD (nibin-nabin, pilla-palla)

Mida tahtsin: muunduri paarissõnadele, kus mõlemad pooled käänduvad
(nibinasse-nabinasse, nibina-nabinaga).

Kuidas:
  Sõnaliik (+N) on tagumisel poolel, esimesel poolel sõnaliiki ei märgita.
- Häälikureeglid on samad, mis põhimuundurile (Ann.twolc -> Ann_fono.hfst).
- xfst paneb esimese ja tagumise osa sidekriipsuga kokku. Tulemuses on kõik
  kombinatsioonid, ka valed (nibin-palla, nibina-nabinasse).
- paari_filter.xfscript jätab alles ainult:
  - õiged paarid (nibin-nabin, pilla-palla)
  - mõlemal poolel sama arv
  - kümnes käändes mõlemad pooled samas käändes (nibinasse-nabinasse)
  - ni-, na-, ta- ja ga-käändes esimene pool omastavas (nibina-nabinaga)
  CleanUp jätab analüüsist esimese poole arvu ja käände välja (nibin-nabin+N+Sg+Gen).

Mis ebaõnnestus ja kuidas parandasin:
- Paarissõnadel tuletust ei ole, nii et lisasin filtrisse NoDer.
- Root peab lexc failis olema esimene; build.sh paneb selle nüüd esimeseks.


2. ARVSÕNAD (kakssada, kakskümmend, paarsada, paarkümmend)

Mida tahtsin: muunduri arvsõnadele, kus nii esimene kui teine pool käänduvad
(kahesaja, kahtsadat, paarikümnesse).

Kuidas:
- Esimene pool (kaks, paar) ja teine pool (sada, kümmend) on eraldi lexc failides
  (arv_esi.lexc, arv_tagu.lexc). Sümbolid, semkäänded (-sse, -s, -st ...) ja gi-liide
  tulevad Ann.lexc failist. Sõnaliik (+Num) on tagumisel poolel.
  Tüved on ebaregulaarsed (kaks - kahe - kaht), seepärast on nimetav, omastav ja
  osastav kirjutatud lexc-i otse. Kohakäänded tulevad omastava tüvest + semkäänded.
- arv_filter.xfscript jätab alles ainult õiged käändekombinatsioonid
- CleanUp eemaldab analüüsist esimese poole arvu ja käände,
  nii et analüüs on kakskümmend+Num+Sg+Com+Gi : kahekümnegagi.

Mis ebaõnnestus ja kuidas parandasin:
- Esimene filter jättis esimese poole arvu ja käände analüüsi
  (kaks+Sg+Genkümmend+Sg+Com), sest CleanUp puudus. Lisasin selle.
- Esimeses versioonis olid mõlemad pooled samas käändes ja see andis kohakäänetes
  vale vormi (kahessesajasse). Parandasin nii, et esimene pool on omastavas.
- Mitmuse vorme ei tee, sest need arvsõnad ei mitmustu.
