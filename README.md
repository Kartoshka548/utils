### Utility to record RTSP stream locally with vlc.
###### By default, it also deletes recordings older than 7 days. Current encoding stores 50Gb of video data weekly, 220Gb monthly, 2.6Tb yearly.

**Scheduled by cron, it runs every _ minutes and records RTSP stream for _ minutes. 
File naming convention is record-YYYY-MM-DD-HH-MM-SS.ts**

````
USAGE: 	./start_rtsp_recording -c 127.0.0.1 -s history -d 3600 -r 7
	./start_rtsp_recording -c 127.0.0.1 -s history

Required arguments: 
  -c 	camera			xxx.xxx.xxx.xxx		camera ip (RTSP)
  -s 	storage			/../..				directory WITHOUT trailing '/' to record into

OPTIONS:
  -d 	clip-duration	1800				clip duration in secs (default: 3600 which is 1 hour)
  -r	retention		31					drop recordings after _ days (default: 7)
  -h	Show this message and exit
````
