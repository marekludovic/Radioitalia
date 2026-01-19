#!/bin/bash
set -e
service icecast2 start
sleep 2
RADIO_MMS="mms://radioitalia.wm.p1.str3.com/rditaliahq"
ABIT=128
SR=44100
CHANNELS=2
exec cvlc "$RADIO_MMS"   --no-video   --sout "#transcode{acodec=mp3,ab=${ABIT},channels=${CHANNELS},samplerate=${SR}}:std{access=shout,mux=mp3,dst=source:password@localhost:8000/radioitalia.mp3}"
