#!/usr/bin/env bash

echo "Deleting the old files"
echo "Symlinking files"
#ln -s /gemrc ~/.gemrc
#ln -s ~/dotfiles/gitconfig ~/.gitconfig
#ln -s ~/dotfiles/tigrc ~/.tigrc
#ln -s ~/dotfiles/zshrc ~/.zshrc
#ln -s ~/dotfiles/zsh ~/.zsh

ln -s ~/workspace/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/workspace/dotfiles/gitconfig ~/.gitconfig
ln -s ~/workspace/dotfiles/tigrc ~/.tigrc

ln -s ~/workspace/dotfiles/tmux ~/.config/tmux
ln -s ~/workspace/dotfiles/sheldon ~/.config/sheldon
ln -s ~/workspace/dotfiles/wezterm ~/.config/wezterm
ln -s ~/workspace/dotfiles/nvim ~/.config/nvim
