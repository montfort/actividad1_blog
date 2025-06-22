#!/bin/bash
for img in *.JPEG; do
    magick "$img" -resize 300x "${img%.jpeg}_thumb.jpeg"
done
