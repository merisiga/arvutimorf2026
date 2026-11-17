hfst-lexc variant2.lexc -o liitsona_lex.hfst
hfst-compose-intersect -1 liitsona_lex.hfst -2 astmed.hfst -o liitsona_lexc.hfst

hfst-fst2strings liitsona_lexc.hfst -L 200 > liitsona_lexc.strings


