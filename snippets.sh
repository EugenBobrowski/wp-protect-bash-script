#!/usr/bin/env bash

find ./* -name 'favicon_*' -delete

git add --all wp-content/updraft
git commit -m'updrafts'
git status


sh ../install-wp-cli.sh

wp core download -force --allow-root

git add -all wp-includes/
git add -all wp-admin/
git add -all wp-*.php
git add -all index.php
git add -all xmlrpc.php
git commit -m 'wp up'




wp core verify-checksums -allow-root

wp plugin verify-checksums -all -allow-root

wp plugin install -force -allow-root PLUGINNAME 
wp plugin list -allow-root