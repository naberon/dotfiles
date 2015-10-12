PATH=/usr/local/bin:$PATH
PATH=$HOME/.nodebrew/current/bin:$PATH

export PGDATA=/usr/local/var/postgres
# rbenv
#export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
