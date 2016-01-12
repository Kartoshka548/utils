#! /usr/bin/env sh

# change it also below (in ftpush.sh itself)
SCRIPTS_DIR=/home/scripts # $1 for CLI argument

FTP_PUSH=ftpush.sh 
EXECUTABLE=update_public_dns.sh
LOG=public_ip.log
CRONTAB=crontab.bkp

mkdir $SCRIPTS_DIR
touch $SCRIPTS_DIR/$LOG


# actual script to be executed with cron - discover self public IP 
#-------------------------------------------------
cat $SCRIPTS_DIR/$EXECUTABLE << EOF
#!/usr/bin/env sh

LOG=$1
PUBLIC_IP=$(wget http://ipinfo.io/ip -qO -)
DUCK_DOMAIN=##########################
DUCK_TOKEN=##########################

echo '[' $(date +\%Y-\%m-\%d\ \%Hh\%Mm\%Ss) '] ip:' $PUBLIC_IP 'duckdns.org update:' $(wget -q http://duckdns.org/update/$DUCK_DOMAIN/$DUCK_TOKEN -O -) >> $LOG
EOF


# make it executable
#-------------------------------------------------
chmod +x $SCRIPTS_DIR/$EXECUTABLE


# write local cron jobs file to pull from
#-------------------------------------------------
echo "# every minute" > $SCRIPTS_DIR/$CRONTAB
echo "#*/1 * * * * $SCRIPTS_DIR/$FTP_PUSH $SCRIPTS_DIR/$LOG" >> $SCRIPTS_DIR/$CRONTAB
echo "#* * * * * $SCRIPTS_DIR/$EXECUTABLE $SCRIPTS_DIR/$LOG" >> $SCRIPTS_DIR/$CRONTAB
echo "" >> $SCRIPTS_DIR/$CRONTAB
echo "# every half-hour" >> $SCRIPTS_DIR/$CRONTAB
echo "0,30 * * * * $SCRIPTS_DIR/$EXECUTABLE $SCRIPTS_DIR/$LOG" >> $SCRIPTS_DIR/$CRONTAB


# enable cron
#-------------------------------------------------
mkdir -p /var/spool/cron/crontabs

# install cronjob from local backup file
crontab $SCRIPTS_DIR/$CRONTAB

# schedule it
crond

