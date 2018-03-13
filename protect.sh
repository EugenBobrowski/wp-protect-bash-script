#!/usr/bin/env bash

WP_ROOT=$1

if [ -z "$WP_ROOT" -a "$WP_ROOT"!=" " ]; then
    echo "WP_ROOT is missing"
    exit 2
fi

pgrep exim | xargs kill -9

if [ -f $WP_ROOT'/readme.html' ]; then
    rm $WP_ROOT'/readme.html'
    echo '-------------------------------
Readme.html was deleted.
------------------------------'
fi

if [ ! -f fix-permission.sh ]; then
    wget http://check.dev3.qix.sx/fix-permission.sh
fi
if [ ! -f check.sh ]; then
    wget http://check.dev3.qix.sx/check.sh
fi
if [ ! -f install-wp-cli.sh ]; then
    wget http://check.dev3.qix.sx/install-wp-cli.sh
fi

echo '-------------------------------
Fix-permission.sh...
'
sh ./fix-permission.sh $WP_ROOT

if [ ! -d .git/ ]; then
    git init
    echo  $WP_ROOT'wp-content/uploads' > .gitignore
    if [ ! -f .gitignore ]; then
        echo  $WP_ROOT'wp-content/uploads' > .gitignore
    fi
    if [ -f ${WP_ROOT}/wp-content/updraft ]; then
        echo  $WP_ROOT'wp-content/updraft' >> .gitignore
    fi
    if [ -f ${WP_ROOT}/wp-content/cache ]; then
        echo  $WP_ROOT'wp-content/cache' >> .gitignore
    fi

    git add .
    git commit -m 'init' .
fi

sh ./check.sh ${WP_ROOT}