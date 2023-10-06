#!/bin/bash

# Credits to @uriel1998
# Check original scripts on https://github.com/uriel1998/cmus_pls

################################################################################
#  A simple utility to convert standard playlists for CMus
#
#  by Steven Saus
# 
#  CMus is located at http://CMus.sourceforge.net/
#
#  CMus is a console music player that can accept playlists.  Usually I use a 
#  heavier application for actually managing my music library and creating 
#  playlists - but I like lighter applications for actually just playing the
#  tunes.  
#
#  The playlist that CMus takes (at least as of v2.3.3, which is what I have, 
#  though it's up to 2.5...) is a simple flat file of fully qualified paths
#  to the music (located at /home/USER/.cmus/playlist.pl ).  This script converts
#  a PLS format playlist, strips all the extra out, and changes the playlist.
#
#  Updated with Lizzy support:  http://sourceforge.net/projects/lizzy/?source=dlp
#  Lizzy lets you use any type of playlist instead of just PLS formats
#  You should be able to use this as-is without Lizzy existing, you'll just be limited
#  to PLS conversion.
#
#  Note that CMus overwrites the playlist upon exit.  Which is fine for me...
#  but to avoid problems, the script detects that so you don't have unexpected
#  behavior.
#
#  First argument is a path to where the playlists are located;  if there is no
#  argument, the current directory is used.  This script OVERWRITES whatever
#  playlist is in ~/.cmus/playlist.pl
#
#  Licensed under a Creative Commons BY-SA 3.0 Unported license
#  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.
#
################################################################################

lizzyroot="$HOME/Apps/Lizzy-1.1.1"
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$lizzyroot/lib



# I've hardcoded my playlist directory here for my convenience.
cd $HOME/Documents/Playlists


if [ -d "$1" ]; then
	playlistdir="$1"
else
	playlistdir="$PWD"
fi


isrunning=$(ps aux | grep CMus | awk '{print $11}' | grep CMus)

if [ "$isrunning" = "CMus" ]; then
	echo "###############################################################################"
	echo "Please exit CMus before running this utility."
	echo "CMus will overwrite any changes you make."
	echo "###############################################################################"	
else
	if [ -f "$lizzyroot/lizzy.jar" ]; then
		filelist=$(find "$playlistdir" -maxdepth 1 -type f -name "*.m3u" -or -name "*.pls" -or -name "*.xspf" -or -name "*.asx" )
	else 
		filelist=$(find "$playlistdir" -maxdepth 1 -type f -name "*.pls")
	fi
	if [ "$filelist" == "" ]; then
		echo "###############################################################################"
		echo "Please specify the directory where your playlists are located:"
		echo " "
		echo "CMus_playlistgen.sh /PATH/TO/PLAYLISTS"
		echo " "
		echo "Or run this utility from the directory where they are located."
		echo "###############################################################################"	
	else
		if [ -d "$HOME/.config/cmus" ]; then
			echo "###############################################################################"
			if [ -f "$HOME/.config/cmus/playlist.pl" ]; then
				time=`date +_%Y%m%d_%H%M%S`
				echo "Backing up CMus playlist to playlist$time.pl"
				cp "$HOME/.config/cmus/playlist.pl" "$HOME/.config/cmus/playlist_$time.pl"
				echo "###############################################################################"
			fi
			echo "Choose the playlist to convert to CMus format."
			echo "Playlist will be written to $HOME/.config/cmus/playlist.pl"
			for fileName in $filelist; do
					echo $fileName
				    if [ -n "$fileName" ]; then
			    		if [ -f "$lizzyroot/lizzy.jar" ]; then
 						echo "###############################################################################"
 						echo "Converting $fileName with Lizzy"
			    			echo "###############################################################################"
						bash $lizzyroot/Transcode.sh "$fileName" -t pls >  $HOME/.config/cmus/temp.pls 2> $HOME/text.txt
						name=$(echo "$HOME/.config/cmus/temp.pls")
					else
						name=$(basename "$fileName")
						fi			    				    	
					grep "$name" -e "File" | awk -F "=" '{print $2}' |  sed 's/ /%20/g' | awk '{ gsub("file:///","/"); print $1 }'  > $HOME/.config/cmus/playlist.pl

					# Decode url
					fileBaseName="${fileName##*/}"
					fileBaseName="${fileBaseName%.*}"
					echo $fileBaseName
					sed "s@+@ @g;s@%@\\\\x@g" $HOME/.config/cmus/playlist.pl | xargs -0 printf "%b" > "$HOME/.config/cmus/playlists/$fileBaseName"
					rm $HOME/.config/cmus/playlist.pl
				    fi
				done
			echo "###############################################################################"		
		else
			echo "###############################################################################"
			echo "CMus directory not in expected location of $HOME/.config/cmus"
			echo "Exiting."
			echo "###############################################################################"		
		fi		
	fi
	rm -f $HOME/.config/cmus/temp.pls
fi
