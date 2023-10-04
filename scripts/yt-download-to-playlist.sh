#!/bin/sh

PLAYLIST_FILE="$HOME/d/Others/Music/Playlists/Liked-Songs.pls"
SONGS_DIR="$HOME/d/Others/Music/Songs"
TMP_DIR="$HOME/d/Others/Music"

PLS_LINES=$(cat "$PLAYLIST_FILE" | wc -l)
PLS_ENTRIES=$((($PLS_LINES - 3) / 2))
OLD_PLS_ENTRIES=$PLS_ENTRIES

yt-dlp --extract-audio --audio-format mp3 -f "ba" -P "$TMP_DIR" -o "%(title)s" --embed-metadata --embed-thumbnail "$1"

for SONG_FILE_FULL in "$TMP_DIR"/*.mp3; do
	SONG_FILE=$(basename "$SONG_FILE_FULL")
	SONG_TITLE="${SONG_FILE%.*}"

	mv "$TMP_DIR/$SONG_FILE" "$SONGS_DIR"

	PLS_ENTRIES=$(($PLS_ENTRIES + 1))
	echo "File$PLS_ENTRIES=file://$SONGS_DIR/$SONG_FILE" >> "$PLAYLIST_FILE"
	echo "Title$PLS_ENTRIES=$SONG_TITLE" >> "$PLAYLIST_FILE"

	cmus-remote -C "add -p $SONGS_DIR/$SONG_FILE"
done

sed "s/NumberOfEntries=$OLD_PLS_ENTRIES/NumberOfEntries=$PLS_ENTRIES/g" "$PLAYLIST_FILE" > "$TMP_DIR/Liked-Songs.pls"
mv -f "$TMP_DIR/Liked-Songs.pls" "$PLAYLIST_FILE"
