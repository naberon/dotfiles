#!/bin/sh

# Make sure using latest Homebrew
echo 'brew update'
brew update 2> /dev/null

# Update already-installed formula
echo 'brew upgrade'
brew upgrade 2> /dev/null

IFS_BACKUP=$IFS
IFS=$'\n'

cmds=(

# For cask
"brew tap caskroom/cask" 
"brew install brew-cask"
"brew tap caskroom/versions"
# font
"brew tap sanemat/font"
"brew cask install xquartz"
"brew install ricty"
"brew tap caskroom/fonts"
"brew cask install font-ricty-diminished"

# Formula
"brew install coreutils"
"brew install zsh --disable-etcdir"
"brew install zsh-completions"
"brew install git"
"brew install tig"
"brew install tmux"
"brew install homebrew/x11/xpdf"
"brew install qpdf"
"brew install peco"
"brew install vim --with-ruby --with-lua"
"brew install redis"
"brew install the_silver_searcher"
"brew install reattach-to-user-namespace"
"brew install postgresql"
"brew install python"
"brew install ffmpeg"
"brew install mysql"

# ruby
# tap homebrew/dupes 
# install apple-gcc42
"brew install openssl"
"brew install readline"
"brew install ruby-build"
"brew install rbenv"

"brew install imagemagick"

# liblary for php
#"brew install automake autoconf curl pcre re2c mhash libtool icu4c gettext jpeg libxml2 mcrypt gmp libevente
"brew tap homebrew/homebrew-php"
"brew install php54"

# .dmg apps
"brew cask install thunderbird-ja"
"brew cask install xtrafinder"
"brew cask install night-owl"
"brew cask install bathyscaphe"
"brew cask install pdftk"
"brew cask install libreoffice"
"brew cask install pgadmin3"
"brew cask install vox"
"brew cask install gimp"
"brew cask install the-unarchiver"
"brew cask install skitch"
"brew cask install totalspaces"
"brew cask install onyx"
"brew cask install folx"
"brew cask install vlc"

# web service
"brew cask install wunderlist"
"brew cask install skype"
"brew cask install slack"
"brew cask install evernote"
"brew cask install skype"

# development
"brew cask install coteditor"
"brew cask install iterm2"
"brew cask install sourcetree"
"brew cask install filezilla"
"brew cask install dockertoolbox"
"brew cask install vagrant"
"brew cask install vagrant-manager"

# google 
"brew cask install google-japanese-ime"
"brew cask install google-chrome"

# keyboard
"brew cask install karabiner"
"brew cask install shiftit"
"brew cask install --force clipy"

# kindle
"brew cask install kindle"
"brew cask install kindle-previewer" # epub -> mobi
"brew cask install calibre" # pdf -> mobi

# doc search
"brew cask install dash" 
"brew cask install alfred"



# Remove outdated versions
"brew cleanup"
"brew cask cleanup"

)


for cmd in ${cmds[@]}; do
  echo ${cmd}
  eval ${cmd} 2>/dev/null
done

IFS=$IFS_BACKUP
