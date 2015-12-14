PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/bin:$PATH

# postgresql
export PGDATA=/usr/local/var/postgres

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
