# Start of File
#   - 4 Lines before Categories
# -----------------------------------------------

# If not running interactively, don"t do anything
# -----------------------------------------------
[ -z "$PS1" ] && return


################################################
##############  TERMINAL DISPLAY  ##############
################################################

# Unubtrusive user@name[~/path]:~$
export PS1="\u\[$(tput sgr0)\]\[\033[38;5;250m\]@\[$(tput sgr0)\]\[\033[38;5;15m\]\H[\[$(tput sgr0)\]\[\033[38;5;251m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]:~\\$ \[$(tput sgr0)\]"



################################################
###################  HISTORY  ##################
################################################
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don"t overwrite it
# -----------------------------------------------
shopt -s histappend

# Set variable identifying the chroot you work in
#                      (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi



################################################
###############  BASH COMPLETION  ##############
################################################

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Fix $ cd typing errors
# -----------------------------------------------
shopt -s cdspell


#################################################
#################### ALIASES ####################
#################################################

# Source the aliases to keep this file smaller
source ~/.bashalias

# Pyenv if Used
# -----------------------------------------------
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"

  # Shims for Autocomplete
  export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

  # Autoload virtualenv paths w/plugin
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Git-Extras autocomplete with $gh
# -----------------------------------------------
if [ -f "$HOME/gh_complete.sh" ]; then
   source "$HOME/gh_complete.sh"
fi

# NVM (Node Version Manager) Looks for .nvm in Dir
# -----------------------------------------------
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
fi

##################################################
#################### VARIOUS #####################
##################################################

# grc color Highligting
if hash grc 2>/dev/null; then
  if [ -s ~/etc/grcbash ]; then
    source ~/etc/grcbash
  fi

  if [ -f "$HOME/.grc/grc.bashrc" ]; then
    source "$HOME/.grc/grc.bashrc"
  fi
fi

# GitHub CLI Tool, $ hub
# @install:
#   git clone https://github.com/github/hub.git
#   sudo make install prefix=/usr/local
#   $ hub
if hash hub; then
  eval "$(hub alias -s)"

  # Load Bash Completion(s)Completion
  if [ -f $HOME/.hub.bash_completion ]; then
    . $HOME/.hub.bash_completion
  fi
fi

<<<<<<< HEAD
eval "$(hub alias -s)"
=======
# Comma Navigation
# @example: , d  <TAB>
# @Install: curl -sL https://github.com/shyiko/commacd/raw/v0.3.3/commacd.bash -o ~/.commacd.bash
if [ -f $HOME/.commacd.bash ]; then
  . $HOME/.commacd.bash
fi

# Make less more friendly for non-text input files, see lesspipe(1)
# -----------------------------------------------
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# For private exports which you don't place in git
if [ ! -f ~/.private_exports ]; then
  touch ~/.private_exports
else
  . ~/.private_exports
fi

if [ -f ~/.dockerrc ]; then
  . ~/.dockerrc
fi


# End of File
# -----------------------------------------------
