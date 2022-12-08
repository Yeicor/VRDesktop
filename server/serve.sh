#!/usr/bin/env bash

INPUT_LINUX="-video_size 1920x1080 -f x11grab -i :0.0+0,360"

CODEC_NVENC="-c:v h264_nvenc"
CODEC_CPU="-c:v h264 -preset ultrafast -tune zerolatency"

FORMAT_FMP4="-f mp4 -movflags frag_keyframe+empty_moov -frag_duration 100000" # 100ms fragments

OUTPUT_HTTP_SERVER="-listen 1 http://127.0.0.1:8080/video.mp4"

ffmpeg -r 30 $INPUT_LINUX -r 30 $CODEC_NVENC $FORMAT_FMP4 $OUTPUT_HTTP_SERVER
