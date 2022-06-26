#! /bin/bash
if [ -f "$HOME/downloads/backup.ratio" ]; then
	mv $HOME/downloads/backup.ratio $HOME/.dotfiles/ratio;
fi

if [ $(find . -name '*.rmbak' -type f) ]; then
	echo test;
	mv $HOME/downloads/*.rmbak $HOME/.dotfiles/metro/metro-backup.rmbak;
fi

cd $HOME/.dotfiles;
git add $HOME/.dotfiles/ratio/backup.ratio;
git add $HOME/.dotfiles/metro/metro-backup.rmbak;
git commit -m "Update ratio and metro config";
git push;
