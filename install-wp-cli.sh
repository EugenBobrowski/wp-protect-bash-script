#!/usr/bin/env bash

if [ -f /usr/local/bin/wp ]; then
    echo "wp-cli is installed"
    exit 2
fi
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
if [ -d /etc/php5 ]; then
    apt-get install php5-cli -y
fi
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info