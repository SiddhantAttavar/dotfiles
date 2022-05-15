mv $HOME/downloads/backup.ratio $HOME/.dotfiles/ratio;
cd $HOME/.dotfiles;
git add $HOME/.dotfiles/ratio/backup.ratio;
git commit -m "Update ratio config";
git push;
