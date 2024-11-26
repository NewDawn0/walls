#!/bin/bash

# Why:
#   The files need to be individually committed since they are too big for multiple to be uploaded in one go

deleted=()
added=()

status_output=$(git status --porcelain)

while IFS= read -r line; do
    echo "Checking $line"
    status=$(echo "$line" | awk '{print $1}')
    file=$(echo "$line" | awk '{print $2}')

    # Check status
    case "$status" in
        D )
            deleted+=("$file")
            ;;
        ?? | M )
            added+=("$file")
            ;;
    esac
done <<< "$status_output"

# Commit deleted
for file in "${deleted[@]}"; do
    fname=$(basename "$file")
    git rm "$file" && git commit -m "deleted $fname" && git pu
done
# Commit new/modified
for file in "${added[@]}"; do
    fname=$(basename "$file")
    git add "$file" && git commit -m "added $fname" && git pu
done
