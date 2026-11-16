hfst-lexc grupeeritud_reeglid.lexc > grupeeritud_reeglid.hfst

hfst-twolc grupeeritud_fono.twolc > grupeeritud_fono.compose.hfst

hfst-compose-intersect grupeeritud_reeglid.hfst grupeeritud_fono.compose.hfst > grupeeritud_fono.hfst

# 1. muundur

#blokeeri tuletus
printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"grupeeritud_fono.hfst\"\n\
        save grupeeritud_fono_naide.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings -L 150 grupeeritud_fono_naide.hfst > grupeeritud_fono.strings