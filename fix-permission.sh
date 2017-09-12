#!/bin/bash
#
# This script configures WordPress file permissions based on recommendations
# from http://codex.wordpress.org/Hardening_WordPress#File_permissions
#
# Author: Michael Conigliaro <mike [at] conigliaro [dot] org>
#
WP_OWNER=root # <-- wordpress owner
WP_GROUP=root # <-- wordpress group
WP_ROOT=$1 # <-- wordpress root directory
WS_GROUP=www-data # <-- webserver group

if [ ! -f ${WP_ROOT}/wp-config.php ]; then
    echo "File wp-config.php not exists.\nCurrent directory is not a wp root di"
    exit 2
fi

# reset to safe defaults
find ${WP_ROOT} -exec chown ${WP_OWNER}:${WP_GROUP} {} \;
find ${WP_ROOT} -type d -exec chmod 755 {} \;
find ${WP_ROOT} -type f -exec chmod 644 {} \;

# allow wordpress to manage wp-config.php (but prevent world access)
chgrp ${WS_GROUP} ${WP_ROOT}/wp-config.php
chmod 640 ${WP_ROOT}/wp-config.php

# allow wordpress to manage wp-content
find ${WP_ROOT}/wp-content -exec chgrp ${WS_GROUP} {} \;
find ${WP_ROOT}/wp-content -type d -exec chmod 775 {} \;
find ${WP_ROOT}/wp-content -type f -exec chmod 664 {} \;

#find ${WP_ROOT}/wp-content/uploads -exec chgrp ${WS_GROUP} {} \;
#find ${WP_ROOT}/wp-content/uploads -type d -exec chmod 775 {} \;
#find ${WP_ROOT}/wp-content/uploads -type f -exec chmod 664 {} \;
#
#if [ ! -f ${WP_ROOT}/wp-content/updraft ]; then
#    find ${WP_ROOT}/wp-content/logs -exec chgrp ${WS_GROUP} {} \;
#    find ${WP_ROOT}/wp-content/logs -type d -exec chmod 775 {} \;
#    find ${WP_ROOT}/wp-content/logs -type f -exec chmod 664 {} \;
#fi
#
#if [ ! -f ${WP_ROOT}/wp-content/updraft ]; then
#    find ${WP_ROOT}/wp-content/updraft -exec chgrp ${WS_GROUP} {} \;
#    find ${WP_ROOT}/wp-content/updraft -type d -exec chmod 775 {} \;
#    find ${WP_ROOT}/wp-content/updraft -type f -exec chmod 664 {} \;
#fi

