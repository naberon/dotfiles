#!/usr/bin/env bash

echo "Deleting the old files"
echo "Symlinking files"
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

