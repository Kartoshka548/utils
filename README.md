### Utility to record RTSP stream locally with vlc. ### 
###### By default, it also deletes recordings older than 7 days (50Gb of video data weekly). ######

*Scheduled by cron, it runs every 30 minutes and records camera RTSP stream for 30 minutes, after which new file is created. 
File format is record-YYYY-MM-DD-HH-MM-SS.ts*


USAGE: ./start_rtsp_recording -c 127.0.0.1 -s history -d 3600 -r 7

Required arguments: 
  -c 	camera 		- xxx.xxx.xxx.xxx'	camera ip (RTSP)
  -s 	storage 	/../.. 			directory WITHOUT TRAIING SLASH to record into

OPTIONS:
  -d 	clip-duration 	3600 			clip duration in secs
  -r    retention	7			days to keep the records for, after which they are removed
  -h 	Show this message
