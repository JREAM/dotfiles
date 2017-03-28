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
source ~/.bash_aliases

# Git-Extras autocomplete with $gh
# -----------------------------------------------
if [ -f "$HOME/gh_complete.sh" ]; then
   source "$HOME/gh_complete.sh"
fi

##################################################
#################### VARIOUS #####################
##################################################

# Make less more friendly for non-text input files, see lesspipe(1)
# -----------------------------------------------
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# End of File
# -----------------------------------------------
