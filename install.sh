#!/usr/bin/env bash

echo "Symlinking files"

# シンボリックリンクを作成する関数（既存の場合はスキップ）
create_link() {
    local src=$1
    local dest=$2
    if [ -L "$dest" ]; then
        echo "Skip: $dest (already exists)"
    else
        ln -s "$src" "$dest"
        echo "Created: $dest -> $src"
    fi
}

create_link ~/workspace/dotfiles/zsh/.zshrc ~/.zshrc
create_link ~/workspace/dotfiles/gitconfig ~/.gitconfig
create_link ~/workspace/dotfiles/tigrc ~/.tigrc

create_link ~/workspace/dotfiles/tmux ~/.config/tmux
create_link ~/workspace/dotfiles/sheldon ~/.config/sheldon
create_link ~/workspace/dotfiles/wezterm ~/.config/wezterm
create_link ~/workspace/dotfiles/nvim ~/.config/nvim
create_link ~/workspace/dotfiles/lazygit ~/.config/lazygit
