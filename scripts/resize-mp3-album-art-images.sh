SONG_DIR=${1%/}
ALBUM_ART_IMAGE="$SONG_DIR/album-art.jpg"

if [ -f "$ALBUM_ART_IMAGE" ]; then
	rm "$ALBUM_ART_IMAGE"
fi

#!/bin/bash
for file in "$SONG_DIR"/*.mp3; do
	if [ ! -f "$file" ]; then
		continue
	fi

	fileName=$(basename -- "$file")
	fileName="${fileName%.*}"
	ffmpeg -i "$file" -an -c:v copy "$ALBUM_ART_IMAGE" > /dev/null

	if [ ! -f "$ALBUM_ART_IMAGE" ]; then
		continue
	fi

	width=$(identify -format "%w" "$ALBUM_ART_IMAGE") > /dev/null
	height=$(identify -format "%h" "$ALBUM_ART_IMAGE") > /dev/null

	if [ $width == $height ]; then
		rm "$ALBUM_ART_IMAGE"
		continue
	fi

	echo "Song: $fileName"
	echo "Initial Width: $width"
	echo "Initial Height: $height"
	echo ""

	convert "$ALBUM_ART_IMAGE" -gravity Center -crop "${height}x${height}+0+0" "$ALBUM_ART_IMAGE" > /dev/null

	width=$(identify -format "%w" "$ALBUM_ART_IMAGE") > /dev/null
	height=$(identify -format "%h" "$ALBUM_ART_IMAGE") > /dev/null

	echo "Final Width: $height"
	echo "Final Height: $height"

	ffmpeg -i "$file" -i "$ALBUM_ART_IMAGE" -c copy -map 0:0 -map 1:0 -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "${fileName}-temp.mp3" > /dev/null
	#mv "${fileName}-temp.mp3" "$file"

	rm "$ALBUM_ART_IMAGE"
done

