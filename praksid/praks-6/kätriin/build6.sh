hfst-lexc parandatud_reeglid.lexc > parandatud_reeglid.hfst

hfst-twolc parandatud_fono.twolc > parandatud_fono.compose.hfst

hfst-compose-intersect parandatud_reeglid.hfst parandatud_fono.compose.hfst > parandatud_fono.hfst

# 1. muundur

# blokeeri tuletus
printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"parandatud_fono.hfst\"\n\
        save naide6_piiratud.hfst\n\
        quit\n" | hfst-xfst


# rakendame talle piiranguid
printf "source muunduri_piiramine.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"naide6_piiratud.hfst\" @\"naide6_piiratud.hfst\"]\n\
        save naide6_skript6.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings -L 50 naide6_skript6.hfst > naide6_skript6.strings