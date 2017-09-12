#!/usr/bin/env bash

WP_ROOT=$1

pgrep exim | xargs kill -9

if [ ! -f fix-permission.sh ]; then
    wget http://check.dev3.qix.sx/fix-permission.sh
fi

sh fix-permission.sh $WP_ROOT

if [ ! -f check.sh ]; then
    wget http://check.dev3.qix.sx/check.sh
fi

if [ ! -f .git ]; then
    git init
    echo  $WP_ROOT'wp-content/uploads' > .gitignore
    if [ ! -f .gitignore ]; then
        echo  $WP_ROOT'wp-content/uploads' > .gitignore
    fi
    if [ -f ${WP_ROOT}/wp-content/updraft ]; then
        echo  $WP_ROOT'wp-content/updraft' >> .gitignore
    fi

    git add .
    git commit -m 'init' .
fi

cd $WP_ROOT
sh check.sh