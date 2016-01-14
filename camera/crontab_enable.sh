#! /usr/bin/env sh

# change it also below (in ftpush.sh itself)
CRONTAB=crontab

# enable cron / stop and restart it with ps | grep cr[o]n
#-------------------------------------------------
mkdir -p /var/spool/cron/crontabs

# install cronjob from local backup file
crontab $CRONTAB

# schedule it
crond