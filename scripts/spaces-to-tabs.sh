#!/bin/bash

convert() {
	unexpand -t 8 --first-only "$1" > /tmp/temp_copy_8.py && \
	unexpand -t 4 --first-only /tmp/temp_copy_8.py > /tmp/temp_copy_4.py && \
	# unexpand -t 2 --first-only /tmp/temp_copy_4.py > /tmp/temp_copy_2.py && \
	# cat /tmp/temp_copy_2.py > "$1"
	cat /tmp/temp_copy_4.py > "$1"
}

while [[ "$1" != "" ]] ; do
	convert "$1"
	shift
done
