#!/bin/bash
links=`cat music_links`
array=( $links )
output="./output/"

if [ -d "$output" ]; then
    echo "Exists"
else
    mkdir output
fi

for link in ${!array[@]}; do
    echo "$((link+1))/${#array[@]}"
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o "./output/%(title)s.%(ext)s" ${array[$link]}
done