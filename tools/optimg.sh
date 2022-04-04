#!/bin/bash

# Check software requirements
requirements="exiv2 mogrify jpegoptim optipng"
for req in $requirements; do
    if ! command -v "$req" >/dev/null 2>&1; then
        echo "Error: $req is not installed"
        exit 1
    fi
done

# Traitement
img_folder="./static/images"
tmp_folder="$(mktemp -d)"
optimized_files="$img_folder/optimized"

# Opt jpg
while read -r img; do
    if grep "$img" "$optimized_files" >/dev/null 2>&1; then
		echo "Skip optimizing $img"
        continue
    fi

    echo "Optimizing $img"
    new="$tmp_folder/$(basename "$img")"

	mogrify -resize '1400>' "$img"
	jpegoptim --strip-all -m90 -d "$tmp_folder" "$img"

    if [ "$(stat -c %s "$img")" -gt "$(stat -c %s "$new")" ]; then
        mv "$new" "$img"
    else
        rm "$new"
    fi

    echo "$img" >> "$optimized_files"
done < <(find "$img_folder" -type f -regex '.*\.jpe?g')

# Opt png name -type f
while read -r img; do
    if grep "$img" "$optimized_files" >/dev/null 2>&1; then
		echo "Skip optimizing $img"
        continue
    fi

    echo "Optimizing $img"
    new="$tmp_folder/$(basename "$img")"

	mogrify -resize '1400>' "$img"
	optipng -clobber -strip all -o5 -out "$new" "$img"

    if [ "$(stat -c %s "$img")" -gt "$(stat -c %s "$new")" ]; then
        mv "$new" "$img"
    else
        rm "$new"
    fi

    echo "$img" >> "$optimized_files"
done < <(find "$img_folder" -type f -regex '.*\.png')

rmdir "$tmp_folder"
