#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASHRC                                                          ║
# ╚═════════════════════════════════════════════════════════════════╝

# If not running interactively, don't do anything
# ___________________________________________________________________
# Prevent this from non-tty shell problem with output
#[ -z "$PS1" ] && echo "n/a"

#echo "DEBUG"
#set -x

# function command_exists() { return }  # Not Needed (Old Hotfix)

# Disable Middle Mouse Button
# (!) Find by running: $ xinput
xinput set-button-map 'Elan Touchpad' 1 0 3 4 5 6 7 2>/dev/null

# ┌─────────────────────────────────────────────────────────────────┐
# │ Source Other Files                                              │
# ├─────────────────────────────────────────────────────────────────┤
# │ (!) Let Bash Variables come first to use within every area.     │
# │ (!) Load exports first                                          │
# └─────────────────────────────────────────────────────────────────┘
# For private exports [Don't place in git]
[[ -f ~/.exports_private ]] && source ~/.exports_private # || echo 'Missing'
[[ -f ~/.bash_vars ]] && source ~/.bash_vars
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.bash_vendors ]] && source ~/.bash_vendors

# ┌─────────────────────────────────────────────────────────────────┐
# │ Terminal Display                                                │
# └─────────────────────────────────────────────────────────────────┘
# https://bashrcgenerator.com/
export PS1="[\[\033[0m\]\[\033[0;94m\]\w\[\033[0m\]] \[\033[0m\]\[\033[0;93m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\033[0m\]\n\u-> \[\033[0m\]"

# ┌─────────────────────────────────────────────────────────────────┐
# │ Preferences: History                                            │
# └─────────────────────────────────────────────────────────────────┘
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# Append to the history file, don"t overwrite it
shopt -s histappend

# Set variable identifying the chroot you work in
#                      (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Bash Completion                                                 │
# └─────────────────────────────────────────────────────────────────┘
# Disable for now getting an error of _command_exists not found
#[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
#  . /usr/share/bash-completion/bash_completion

# Fix $ cd typing errors
shopt -s cdspell

# Make 'less' friendlier for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
