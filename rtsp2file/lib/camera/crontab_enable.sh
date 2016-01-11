#! /usr/bin/env sh

# change it also below (in ftpush.sh itself)
SCRIPTS_DIR=/home/scripts # $1 for CLI argument
EXECUTABLE=ftpush.sh 

mkdir $SCRIPTS_DIR


# crontab line to pull from
#-------------------------------------------------
echo "*/1 * * * * $SCRIPTS_DIR/$EXECUTABLE" > $SCRIPTS_DIR/crontab.bkp 

# testing cron that it works with simple echo loop below
touch $SCRIPTS_DIR/heys.txt


# actual script to be executed with cron - discover self public IP (and post it somewhere later on) 
#-------------------------------------------------
cat $SCRIPTS_DIR/$EXECUTABLE << EOF
#!/usr/bin/env sh  
DIR=/home/scripts
echo $(date +\%Y-\%m-\%d_\%Hh\%Mm\%Ss)': '$(wget http://ipinfo.io/ip -qO -) > $DIR/heys.txt
EOF

# make it executable
#-------------------------------------------------
chmod +x $SCRIPTS_DIR/$EXECUTABLE



# enable cron
#-------------------------------------------------
mkdir -p /var/spool/cron/crontabs

# install cronjob from local backup file
crontab $SCRIPTS_DIR/crontab.bkp

# schedule it
crond

