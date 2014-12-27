#!/usr/bin/env bash

echo "Deleting the old files"
echo "Symlinking files"
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tigrc ~/.tigrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/zshprofile ~/.zshprofile
