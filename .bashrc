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
# │ Distro Determination                                            │
# ├─────────────────────────────────────────────────────────────────┤
# │ (bash_aliases has functions)                                    │
# └─────────────────────────────────────────────────────────────────┘
# Distro Determination
# ___________________________________________________________________
DISTRO=$(lsb_release -i | xargs); DISTRO=${LSB:16:50};
case "$LSB" in
  CentOS)         PKGM="yum";;
  Ubuntu|Debian)  PKGM="apt";;
esac


# ┌─────────────────────────────────────────────────────────────────┐
# │ Terminal Display                                                │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Unobtrusive user@name[~/path]:~$
# Unobtrusive user@name[~/path (git-branch)]:~$
export PS1="\u\[$(tput sgr0)\]\[\033[38;5;250m\]@\[$(tput sgr0)\]\[\033[38;5;15m\]\H[\[$(tput sgr0)\]\[\033[38;5;251m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\[$(tput sgr0)\]\[\033[38;5;15m\]]:~\\$ \[$(tput sgr0)\]"

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

