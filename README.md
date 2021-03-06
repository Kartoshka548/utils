### Record RTSP streams with vlc or openRTSP.
###### By default, delete recordings older than 7 days. Current encoding with vlc stores 50Gb of video data weekly, 220Gb monthly, 2.6Tb yearly.

**Scheduled by cron, it runs every _ minutes and records RTSP stream for _ minutes. 
File naming convention is record-YYYY-MM-DD-HH-MM-SS.ts**

````
USAGE: 	./start_rtsp_recording -c rtsp://127.0.0.1:554/stream -s history -d 3600 -r 7
	./start_rtsp_recording -c rtsp://127.0.0.1:554/stream -s history

Required arguments: 
  -c 	camera			xxx.xxx.xxx.xxx		RTSP stream
  -s 	storage			/../..				directory WITHOUT trailing '/' to record into

OPTIONS:
  -d 	clip-duration	1800				clip duration in secs (default: 3600 which is 1 hour)
  -r	retention		31					drop recordings after _ days (default: 7)
  -h	Show this message and exit
````

### IPcam: RTSP, DynamicDNS + miniwebserver
  [HTML: Welcome page](http://htmlpreview.github.io/?https://github.com/Kartoshka548/utils/blob/master/camera/home/web/index.html)
    *Xiaomi Yi IP Cam is a 'dropcam clone mini computer with wifi module, sold as an IP Camera.* 
	It runs `Linux 3.0.8` with `ARM926EJ-S (ARMv5TEJ)` CPU, on `hi3518` machine. It exposes a mini web server which is updated to load simple html welcome page. This HTML page is periodically modified by cron job with sed -i to include information about CPU load. More importantly though, another cron job frequently makes a request with wget to update dynamicDNS server, kindly provided by [duckdns.org](www.duckdns.org) team - keeping DNS synchronized with dynamic IP of camera's router.
