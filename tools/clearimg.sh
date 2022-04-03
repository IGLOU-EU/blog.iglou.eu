#!/bin/bash

# Iterate over all images
for file in static/images/*
do
    name=$(basename "$file")

    if grep -r "$name" content/ > /dev/null ; then
        continue
    fi

    echo "The file $file is not referenced in content/."
    rm -f "$file"
done