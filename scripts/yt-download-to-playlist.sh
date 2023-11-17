#!/bin/bash

for ARGUMENT in "$@"; do
	KEY=$(echo $ARGUMENT | cut -f1 -d=)

	KEY_LENGTH=${#KEY}
	VALUE="${ARGUMENT:$KEY_LENGTH+1}"

	export "$KEY"="$VALUE"
done

playlists="$playlists,Liked-Songs"
if [[ -z "$url" ]]; then
	url=$(ytfzf -c yt-music -I link | tail -n 1)
fi

PLAYLIST_DIR="$HOME/d/Others/Music/Playlists"
SONGS_DIR="$HOME/d/Others/Music/Songs"
TMP_DIR="$HOME/d/Others/Music"
CMUS_PL_DIR="$HOME/.config/cmus/playlists"
CMUS_LIB_FILE="$HOME/.config/cmus/lib.pl"

if [[ $TERMUX == 1 ]]; then
	PLAYLIST_DIR="$HOME/storage/music/Playlists"
	SONGS_DIR="$HOME/storage/music/Songs"
	TMP_DIR="$HOME/storage/music"
	CMUS_PL_DIR="$HOME/.config/cmus/playlists"
fi


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
	SONG_TITLE="${SONG_FILE% \[*\].*}"

	if [ "$SONG_TITLE" == "\*" ]; then
		continue
	fi

	mv "$TMP_DIR/$SONG_FILE" "$SONGS_DIR"

	PLS_ENTRIES=$(($PLS_ENTRIES + 1))

	echo "$SONGS_DIR/$SONG_FILE" >> "$CMUS_LIB_FILE"

	while IFS=',' read -ra ADDR; do
		for pl in "${ADDR[@]}"; do
			if [[ -z "$pl" ]]; then
				continue
			fi

			PLAYLIST_FILE="$PLAYLIST_DIR/$pl.pls"
			PLS_LINES=$(cat "$PLAYLIST_FILE" | wc -l)
			PLS_ENTRIES=$((($PLS_LINES - 3) / 2))
			OLD_PLS_ENTRIES=$PLS_ENTRIES
			PLS_ENTRIES=$(($PLS_ENTRIES + 1))
			echo "$SONGS_DIR/$SONG_FILE" >> "$CMUS_PL_DIR/$pl"
			echo "File$PLS_ENTRIES=file://$SONGS_DIR/$SONG_FILE" >> "$PLAYLIST_FILE"
		echo "Title$PLS_ENTRIES=$SONG_TITLE" >> "$PLAYLIST_FILE"
			sed "s/NumberOfEntries=$OLD_PLS_ENTRIES/NumberOfEntries=$PLS_ENTRIES/g" "$PLAYLIST_FILE" > "$TMP_DIR/$pl.pls"
			mv -f "$TMP_DIR/$pl.pls" "$PLAYLIST_FILE"
		done
	done <<< "$playlists"
}

find "$TMP_DIR"/*.mp3 -maxdepth 1 -type f | while read file; do add_to_play_list "$file"; done

