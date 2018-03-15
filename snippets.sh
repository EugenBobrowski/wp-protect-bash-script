#!/usr/bin/env bash

find ./* -name 'favicon_*' -delete

git add --all wp-content/updraft
git commit -m'updrafts'
git status

##############################
# install cli
sh ../install-wp-cli.sh

##############################
# reinstall core
wp core download --force --allow-root

##############################
git add --all wp-includes/
git add --all wp-admin/
git add --all wp-*.php
git add --all index.php
git add --all xmlrpc.php
git add --all wp-content/index.php
git add --all wp-content/plugins/index.php
git add --all wp-content/themes/index.php
git commit -m 'wp up'
git status

##############################
# clear wp core

wp core verify-checksums --allow-root
git rm -f wp-post.php
git rm -f wp-includes/js/jquery/xynfapud.php
git rm -f wp-includes/.htaccess
git rm -f wp-includes/fonts/dlhtbhrs.php
git rm -f wp-ss.zip
git rm -f wp-admin/css/colors/vndtxguv.php
git rm -f wp-admin/maint/kwwpegcc.php
git rm -f wp-admin/.htaccess

git rm FILES
git commit -m 'rm unverified wp files'
git status


##############################
# check uploads are ignored
nano ../.gitignore
git status

git clean -fd
git rm license.txt -f
git rm wp-content/themes/twenty* -rf
git commit -m 'rm twenty* themes'
git status

##############################
# clear plugins

wp plugin verify-checksums --all --allow-root

wp plugin install --force --allow-root PLUGINNAME

git rm wp-content/plugins/multi-plugin-installer
git add --all wp-content/plugins/PLUGINNAME

git commit -m 'clear plugins'
git status


wp plugin --allow-root list

##############################
# clean themes

git rm -rf wp-content/themes/twenty*
git commit -m 'rm default themes'
git status

