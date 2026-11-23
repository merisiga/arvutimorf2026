#!/bin/sh
set -e

hfst-twolc astmed.twolc -o astmed.hfst

hfst-lexc lihtsonad.lexc -o lihtsonad_lex.hfst
hfst-compose-intersect -1 lihtsonad_lex.hfst -2 astmed.hfst -o lihtsonamuundur.hfst

rm -f liitsonaxfst.hfst
hfst-xfst < liitsona.xfscript
test -s liitsonaxfst.hfst || { echo "xfst ebaõnnestus"; exit 1; }