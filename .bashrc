#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASHRC                                                          ║
# ╠═════════════════════════════════════════════════════════════════╣
# ║ Entry Point to all Bash Utilities                               ║
# ╚═════════════════════════════════════════════════════════════════╝

# If not running interactively, don't do anything
# ___________________________________________________________________
[ -z "$PS1" ] && return


# ┌─────────────────────────────────────────────────────────────────┐
# │ Source Other Files                                              │
# ├─────────────────────────────────────────────────────────────────┤
# │ Let Bash Variables come first to use within every area.         │
# └─────────────────────────────────────────────────────────────────┘

# For private exports [Don't place in git]
# @ Load Before other items incase exports are needed.
# ___________________________________________________________________

[[ -f ~/.exports_private ]] && source ~/.exports_private # || echo 'Missing'
[[ -f ~/.bash_vars ]] && source ~/.bash_vars
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.bash_vendors ]] && source ~/.bash_vendors
[[ -f ~/.bash_snippets ]] && source ~/.bash_snippets
# Unobtrusive user@name[~/path]:~$
# ┌─────────────────────────────────────────────────────────────────┐
# │ Terminal Display                                                │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# Unobtrusive user@name[~/path (git-branch)]:~$
cust1=$(echo -e "\u${yellow}->${ColorOff}")
export PS1="${NoColor}[\[\033[38;5;251m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\n ${cust1}\[$(tput sgr0)\] "

# Alternative, 2 line
#export PS1="[$(tput sgr0)\]\[\033[38;5;251m\]\w\[\033[33m\]\]\$(parse_git_branch)\[\033[00m\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\n\u\033[33m\]->\033[00m\] \[$(tput sgr0)\]"
cust2=$(echo -e "${yellow} -> ${ColorOff} ")
export PS2="$cust2 "

# Docker Related (Prevent error if docker is not installed)
if hash docker 2>/dev/null; then
  if [[ -f ~/.dockerrc ]]; then
    source ~/.dockerrc
  fi
fi


# ┌─────────────────────────────────────────────────────────────────┐
# │ Preferences: History                                            │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# Append to the history file, don"t overwrite it
# ___________________________________________________________________
shopt -s histappend

# Set variable identifying the chroot you work in
#                      (used in the prompt below)
# ___________________________________________________________________
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi


# ┌─────────────────────────────────────────────────────────────────┐
# │ Bash Completion                                                 │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

# Fix $ cd typing errors
# ___________________________________________________________________
shopt -s cdspell


# Make less more friendly for non-text input files, see lesspipe(1)
# ___________________________________________________________________
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

