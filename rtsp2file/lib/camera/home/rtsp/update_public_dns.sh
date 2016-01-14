#!/usr/bin/env sh

LOG=$1
PUBLIC_IP=$(wget http://ipinfo.io/ip -qO -)

DUCK_DOMAIN=<UPDATE_YOURS>
DUCK_TOKEN=<UPDATE_YOURS>

echo '[' $(date +\%Y-\%m-\%d\ \%Hh\%Mm\%Ss)' EST ] ip:' $PUBLIC_IP 'duckdns.org update:' $(wget -q http://duckdns.org/update/$DUCK_DOMAIN/$DUCK_TOKEN -O -) >> $LOG
