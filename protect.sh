#!/usr/bin/env bash

pgrep exim | xargs kill -9

git init
git add .
git commit -m 'init' .