#!/usr/bin/env bash

INPUT_LINUX="-video_size 1920x1080 -f x11grab -i :0.0+0,360"

CODEC_NVENC_FMP4="-f mp4 -c:v h264_nvenc -movflags frag_keyframe+empty_moov"
CODEC_CPU_FMP4="-f mp4 -c:v h264 -preset ultrafast -tune zerolatency -movflags frag_keyframe+empty_moov"

OUTPUT_HTTP_SERVER="-listen 1 http://127.0.0.1:8080/video.mp4"

ffmpeg -r 30 $INPUT_LINUX -r 30 $CODEC_NVENC_FMP4 $OUTPUT_HTTP_SERVER
