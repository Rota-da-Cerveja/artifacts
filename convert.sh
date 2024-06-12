#!/bin/bash

mkdir output
mkdir -p static/monochrome
mkdir -p static/colorful

for img in *.jpeg; do
    newname=$(echo $img | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
    newname=$(echo $newname | iconv -f UTF-8 -t ASCII//TRANSLIT)

    bin/cli "$img"

    cwebp -q 80 "output/${img%.jpeg}_gray_5:3.png" -o "static/monochrome/${newname%.jpeg}.webp"
    cwebp -q 80 "$img" -o "static/colorful/${newname%.jpeg}.webp"
done
