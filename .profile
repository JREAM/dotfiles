# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Source on start
source ~/.bashrc

if ! hash compdef >/dev/null 2>&1; then
  alias compdef='echo 0 >/dev/null'
fi

# ---------------------------------------------------
#
# Fix compdef if not exists
# ---------------------------------------------------
if (!( $+commands[compdef] )) >/dev/null 2>&1; then
  alias compdef='1 >/dev/null'
fi


# ---------------------------------------------------
# Path
# ---------------------------------------------------

# Always inlude the usr/local/bin
PATH="/usr/local/bin:$PATH"

# If a private ~/bin exists, let's add it
if [[ -d "$HOME/bin" ]] ; then
  PATH="$PATH:$HOME/bin"
fi


# ---------------------------------------------------
# Google Golang
# ---------------------------------------------------

# Add Go to our path if it exists
if [[ -d "/usr/local/go/bin" ]]; then
    PATH=$PATH:/usr/local/go/bin
fi

# Include Google go default path if installed
if [[ -d "$HOME/go" ]]; then
    export GOPATH=$HOME/go
fi

# ---------------------------------------------------
# PHP Composer
# ---------------------------------------------------

# Include local composer folder if exists
export COMPOSER_HOME=""
if [[ -d ~/.composer/vendor/bin ]] ; then
    PATH=~/.composer/vendor/bin:$PATH
    export COMPOSER_HOME=`composer config -g home`
fi

# Include composer autocomplete if exists
if [[ -d "$COMPOSER_HOME/vendor/bamarni/symfony-console-autocomplete" ]]; then
    eval "$(symfony-autocomplete)"
fi

# ---------------------------------------------------
# Bash / Docker Autocomplete
# ---------------------------------------------------

if [[ -n "$BASH_VERSION" ]]; then
    # 1: Include .bashrc
    # 2: include .docker-complete if it exists
    [[ -f ~/.bashrc ]] && source ~/.bashrc
    [[ -f ~/.docker-complete ]] && source ~/.docker-complete
fi

# ---------------------------------------------------
# Final Export
# ---------------------------------------------------
export PATH
