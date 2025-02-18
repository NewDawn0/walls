#!/bin/bash

fd -e "jpg" -e "jpeg" | while read -r file; do
    base="${file%.*}"
    out="${base}.png"

    echo "Converting $file to $out"
    ffmpeg -loglevel quiet -i "$file" "$out"

    if [ $? -eq 0 ]; then
        rm "$file"
    else
        echo "Conversion failed for $file, skipping removal."
    fi
done
