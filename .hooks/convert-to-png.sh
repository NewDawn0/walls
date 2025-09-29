#!/usr/bin/env bash

# For every staged file passed as argument:
for file in "$@"; do
  # Skip if file already ends with .png
  if [[ "$file" =~ \.png$ ]]; then
    continue
  fi
  # Define new file name with .png extension
  new_file="${file%.*}.png"
  # Convert the file to PNG using ffmpeg
  ffmpeg -y -i "$file" "$new_file"
  if [ $? -eq 0 ]; then
    # Remove original file
    git rm "$file"
    # Add the new PNG file to staging area
    git add "$new_file"
  else
    echo "Failed to convert $file"
    exit 1
  fi
done
