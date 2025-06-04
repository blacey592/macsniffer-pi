#!/bin/bash
mkdir -p /output/exif
for file in "$1"/*.jpg; do
  exiftool "$file" > "/output/exif/$(basename "$file").txt"
done
