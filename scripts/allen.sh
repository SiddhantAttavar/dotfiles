#!/bin/bash
for pdf in "$DOWNLOADS_DIR"/*.pdf; do
	if [ ! -f "$pdf" ]; then
		continue;
	fi

	read -p "${pdf##*/} Subject: " subject;

	if [ $subject == 'p' ] ; then
		mv "$pdf" "$ALLEN_DIR/Physics";
	elif [ $subject == 'c' ] ; then
		mv "$pdf" "$ALLEN_DIR/Chemistry";
	elif [ $subject == 'm' ] ; then
		mv "$pdf" "$ALLEN_DIR/Maths";
	elif [ $subject == 'o' ] ; then
		mv "$pdf" "$ALLEN_DIR/Others";
	fi
done
