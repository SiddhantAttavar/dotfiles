#!/bin/bash

for ARGUMENT in "$@"; do
	KEY=$(echo $ARGUMENT | cut -f1 -d=)

	KEY_LENGTH=${#KEY}
	VALUE="${ARGUMENT:$KEY_LENGTH+1}"

	export "$KEY"="$VALUE"
done

PLAYLIST_FILE="$HOME/d/Others/Music/Playlists/Liked-Songs.pls"
SONGS_DIR="$HOME/d/Others/Music/Songs"
TMP_DIR="$HOME/d/Others/Music"
CMUS_PL_DIR="$HOME/.config/cmus/playlists"

PLS_LINES=$(cat "$PLAYLIST_FILE" | wc -l)
PLS_ENTRIES=$((($PLS_LINES - 3) / 2))
OLD_PLS_ENTRIES=$PLS_ENTRIES

# Yt-dlp arguments
YT_DLP_ARGS=( \
	--extract-audio \
	--audio-format mp3 \
	-f "ba" \
	-o "%(title)s [%(id)s]" \
	-P "$TMP_DIR" \
	--embed-thumbnail \
	--embed-metadata \
)
YT_DLP_CLOSING_ARGS=()
EXPLICIT_METADATA=""

if [ -n "$title" ]; then
	YT_DLP_CLOSING_ARGS=( --replace-in-metadata "title" "\S.*" "$title" )
	EXPLICIT_METADATA+="-metadata title=\"$title\" "
fi

if [ -n "$album" ]; then
	YT_DLP_CLOSING_ARGS=( "${YT_DLP_CLOSING_ARGS[@]}" --replace-in-metadata "album" "\S.*" "$album" )
	EXPLICIT_METADATA+="-metadata album=\"$album\" "
fi

if [ -n "$artist" ]; then
	YT_DLP_CLOSING_ARGS=( "${YT_DLP_CLOSING_ARGS[@]}" --replace-in-metadata "album_artist" "\S.*" "$artist" )
	EXPLICIT_METADATA+="-metadata album_artist=\"$artist\" "
fi

if [ -n "$EXPLICIT_METADATA" ]; then
	YT_DLP_ARGS=( "${YT_DLP_ARGS[@]}" --ppa "$EXPLICIT_METADATA" )
	YT_DLP_ARGS=( "${YT_DLP_ARGS[@]}" "${YT_DLP_CLOSING_ARGS[@]}" )
fi

yt-dlp "${YT_DLP_ARGS[@]}" "$url"

add_to_play_list() {
	SONG_FILE=$(basename "$1")
	SONG_TITLE="${SONG_FILE%.*}"

	if [ "$SONG_TITLE" == "\*" ]; then
		continue
	fi

	mv "$TMP_DIR/$SONG_FILE" "$SONGS_DIR"

	PLS_ENTRIES=$(($PLS_ENTRIES + 1))
	echo "File$PLS_ENTRIES=file://$SONGS_DIR/$SONG_FILE" >> "$PLAYLIST_FILE"
	echo "Title$PLS_ENTRIES=$SONG_TITLE" >> "$PLAYLIST_FILE"

	while IFS=',' read -ra ADDR; do
		for pl in "${ADDR[@]}"; do
			echo "$SONGS_DIR/$SONG_FILE" >> "$CMUS_PL_DIR/$pl"
		done
	done <<< "$playlists"
}

find "$TMP_DIR"/*.mp3 -maxdepth 1 -type f | while read file; do add_to_play_list "$file"; done

sed "s/NumberOfEntries=$OLD_PLS_ENTRIES/NumberOfEntries=$PLS_ENTRIES/g" "$PLAYLIST_FILE" > "$TMP_DIR/Liked-Songs.pls"
mv -f "$TMP_DIR/Liked-Songs.pls" "$PLAYLIST_FILE"
