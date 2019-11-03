#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles


dir=~/terraform
olddir=~/dotfiles_old  #backup
files="vimrc vim_runtime spacemacs zshrc tmux.conf  oh-my-zsh emacs.d companyrc config"

#create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

#move any existing dotfiles in homedir to dotfiles_old, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $dir/../.$file
done

# Custom
echo "Moving karabiner to config folder"

mv ~/.config/karabiner ~/dotfiles_old
ln -s $dir/karabiner ~/.config/karabiner

mv ~/.config/ranger ~/dotfiles_old
ln -s $dir/ranger ~/.config/ranger
