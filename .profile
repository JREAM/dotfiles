# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022



# ---------------------------------------------------
# Path
# ---------------------------------------------------

# Always inlude the usr/local/bin
PATH="/usr/local/bin:$PATH"

# If a private ~/bin exists, let's add it
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi


# ---------------------------------------------------
# Go
# ---------------------------------------------------

# Add Go to our path if it exists
if [ -d "/usr/local/go/bin" ]; then
    PATH=$PATH:/usr/local/go/bin
fi

# ---------------------------------------------------
# PHP
# ---------------------------------------------------

# Include local composer folder if exists
export COMPOSER_HOME=""
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
    export COMPOSER_HOME=`composer config -g home`
fi

# Include composer autocomplete if exists
if [ -d "$COMPOSER_HOME/vendor/bamarni/symfony-console-autocomplete" ]; then
    eval "$(symfony-autocomplete)"
fi

# ---------------------------------------------------
# Bash
# ---------------------------------------------------

if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc
    if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    fi
    # include .docker-complete if it exists
    if [ -f "$HOME/.docker-complete" ]; then
        source "$HOME/.docker-complete"
    fi
fi
