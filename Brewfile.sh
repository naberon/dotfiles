#!/bin/sh

# Make sure using latest Homebrew
echo 'brew update'
#brew update 2> /dev/null

# Update already-installed formula
echo 'brew upgrade'
#upgrade 2> /dev/null

IFS_BACKUP=$IFS
IFS=$'\n'

cmds=(

# For cask
"brew tap caskroom/cask" 
"brew install brew-cask"

"brew tap sanemat/font"
"brew install ricty"


"brew cask install Xquartz"

# Formula
"brew install zsh --disable-etcdir"
"brew install git"
"brew install tig"
"brew install coreutils"
"brew install tmux"
"brew install xpdf"
"brew install qpdf"

# ruby
# tap homebrew/dupes 
# install apple-gcc42
"brew install openssl"
"brew install readline"
"brew install ruby-build"
"brew install rbenv"

# .dmg apps
"brew cask install xtrafinder"
"brew cask install sourcetree"
"brew cask install google-japanese-ime"
"brew cask install skype"
"brew cask install filezilla"
"brew cask install iterm2"
"brew cask install yorufukurou"
"brew cask install bathyscaphe"
"brew cask install pdftk"
"brew cask install libreoffice"
"brew cask install alfred"
"brew cask alfred link"

# Remove outdated versions
"brew cleanup"
"brew cask cleanup"

)


for cmd in ${cmds[@]}; do
  echo ${cmd}
  eval ${cmd} 2>/dev/null
done

IFS=$IFS_BACKUP
