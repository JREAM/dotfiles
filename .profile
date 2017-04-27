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
if [[ -d "$HOME/.composer/vendor/bin" ]] ; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
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
    # Include .bashrc
    if [[ -f "$HOME/.bashrc" ]]; then
        source "$HOME/.bashrc"
    fi
    # include .docker-complete if it exists
    if [[ -f "$HOME/.docker-complete" ]]; then
        source "$HOME/.docker-complete"
    fi
fi


# ---------------------------------------------------
# For the the Meteor Framework
# ---------------------------------------------------
if [[ -f "$HOME/.meteor" ]]; then
  PATH=$PATH:$HOME/.meteor
fi


# ---------------------------------------------------
# Ruby Version Manager (RVM)
# ---------------------------------------------------
if [[ -d "$HOME/.rvm/bin" ]]; then
  PATH="$PATH:$HOME/.rvm/bin"
  # Load RVM into a shell session *as a function*
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi


# ---------------------------------------------------
# Apple Swift Language
# ---------------------------------------------------
if [[ -d '/opt/swift/swift-3.0/usr/bin' ]]; then
  PATH=/opt/swift/swift-3.0/usr/bin:$PATH
fi



# ---------------------------------------------------
# Final Export
# ---------------------------------------------------
export PATH
