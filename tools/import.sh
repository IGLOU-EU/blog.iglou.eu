#!/bin/bash

# Iterate over all the files in content/
for file in content/*
do
    # If the file is a directory, skip it
    if [ -d "$file" ]; then
        continue
    fi

    # extract all matched patern
    while read -r line; do
        # extract the url
        url=$(echo "$line" | sed -E -e 's/.*(https?:\/\/[^"]+) ".*/\1/')

        # replace /, %20, space, + and -- with -
        out="/images/$(echo "$url" | sed -E -e 's/https?:\/\///g' -e 's/\//-/g' -e 's/%20/-/g' -e 's/ /-/g' -e 's/\+/-/g' -e 's/--/-/g')"

        # download the file
        if wget –q "$url" -O "static$out" > /dev/null ; then
            echo "Error downloading $url to static/$file"
            continue
        fi

        # replace the url with the new name
        if sed -i "s|$url|$out|g" "$file" > /dev/null ; then
            echo "Error replacing $url with $out in $file"
            continue
        fi
    done < <(grep -oP '!\[[^\]]*\]\(http[^ ]+ ".*"\)' "$file")
done

