#!/usr/bin/env bash

WP_ROOT=$1

if [ -z "$WP_ROOT" -a "$WP_ROOT"!=" " ]; then
    echo "WP_ROOT is missing"
    exit 2
fi

if [ ! -f ${WP_ROOT}/wp-config.php ]; then
    echo "File wp-config.php not exists.\nCurrent directory is not a wp root di"
    exit 2
fi

echo "============================================
find $WP_ROOT/* -name 'favicon_*'
Res: find $WP_ROOT/* -name 'favicon_*' -delete
--------------------------------------------"
find ${WP_ROOT}/* -name 'favicon_*'
echo "\n============================================\n"


echo "============================================
find $WP_ROOT/* -name '*.suspected'
Res: find $WP_ROOT/* -name '*.suspected' -delete
--------------------------------------------"
find ${WP_ROOT}/* -name '*.suspected'
echo "\n============================================\n"


echo "============================================
grep -R '@include \"' $WP_ROOT/*
--------------------------------------------"
grep -R '@include "' ${WP_ROOT}/*
echo "\n============================================\n"


echo "============================================
grep -R 'strrev' --include=*.php $WP_ROOT/*
--------------------------------------------"
grep -R 'strrev' --include=*.php ${WP_ROOT}/*
echo "\n============================================\n"


echo "============================================
grep -R 'exit()' --include='*.php' $WP_ROOT/* -n | grep '.*:1:' -o | grep '.*.php' -o
--------------------------------------------"
grep -R 'exit()' --include='*.php' ${WP_ROOT}/* -n | grep '.*:1:' -o | grep '.*.php' -o
echo "\n============================================\n"


echo "============================================
grep -R '@serialize' $WP_ROOT/*
--------------------------------------------"
grep -R '@serialize' ${WP_ROOT}/*
echo "\n============================================\n"


echo "============================================
grep -R '\$alphabet' $WP_ROOT/*
--------------------------------------------"
grep -R '$alphabet' ${WP_ROOT}/*
echo "\n============================================\n"


echo "============================================
grep -R '@\$GLOBALS' --include='*.php' $WP_ROOT*
grep -R '\$GLOBALS\[\$GLOBALS' --include='*.php' $WP_ROOT*
--------------------------------------------"
grep -R '@$GLOBALS' --include='*.php' ${WP_ROOT}/*
#grep -R '$GLOBALS' --include='*.php' ${WP_ROOT}/*
grep -R '$GLOBALS\[$GLOBALS' --include='*.php' ${WP_ROOT}/*
echo "\n============================================\n"


echo "============================================
find $WP_ROOT/wp-content/uploads/* -name '*.php'
Res: find $WP_ROOT/wp-content/uploads/* -name '*.php' -delete
find $WP_ROOT/wp-content/updraft/* -name '*.php'
Res: find $WP_ROOT/wp-content/updraft/* -name '*.php' -delete
--------------------------------------------"
find ${WP_ROOT}/wp-content/uploads/* -name '*.php'
find ${WP_ROOT}/wp-content/updraft/* -name '*.php'
echo "\n============================================\n"

