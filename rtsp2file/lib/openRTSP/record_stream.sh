#!/usr/bin/env bash

# kill previous instances before
pgrep openRTSP | xargs kill -9 > /dev/null 2>&1

URL=$1
DURATION=$2
VIDEO_LENGTH=$3
PREFIX=$(date +\%Y-\%M-\%d_\%H)

cd ~/rtsp2file/history
../lib/openRTSP/openRTSP -B 10000000 -b 10000000 -q -t -V -w 1280 -h 720 -f 25 -F $PREFIX -d $DURATION -P $VIDEO_LENGTH -D 4 -Q $URL

# self-check
# ../lib/openRTSP/openRTSP -B 10000000 -b 10000000 -q -t -V -w 1280 -h 720 -f 25 -F $(date +\%Y-\%M-\%d_\%H) -d 30 -P 10 -D 4 -Q rtsp://127.0.0.1:554/stream