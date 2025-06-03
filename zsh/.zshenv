PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/.nodebrew/current/bin:$PATH
PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
PATH=$HOME/Library/Android/sdk/tools:$PATH
export PATH=$HOME/bin:$PATH

# postgresql
export PGDATA=/usr/local/var/postgres

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# naoqi
export PYTHONPATH=PYTHONPATH:/Users/watanabe/naoqi_sdk/pynaoqi-python2.7-2.1.4.13-mac64
export DYLD_LIBRARY_PATH=DYLD_LIBRARY_PATH:/Users/watanabe/naoqi_sdk/pynaoqi-python2.7-2.1.4.13-mac64

### Virtualenvwrapper
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#    export WORKON_HOME=$HOME/.virtualenvs
#    source /usr/local/bin/virtualenvwrapper.sh
#fi
