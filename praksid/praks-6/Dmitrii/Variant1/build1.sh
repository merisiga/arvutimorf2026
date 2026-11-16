#!/bin/sh
set -e
hfst-twolc astmed.twolc -o astmed.hfst

# võimalus 1
hfst-lexc lihtsonad.lexc -o lihtsonad_lex.hfst
hfst-compose-intersect -1 lihtsonad_lex.hfst -2 astmed.hfst -o lihtsonamuundur.hfst
hfst-xfst -F liitsona.xfscript            # -> liitsona_xfst.hfst

 

