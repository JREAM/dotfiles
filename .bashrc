#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASHRC                                                          ║
# ╚═════════════════════════════════════════════════════════════════╝

# Autoload Keychain SSH ID
if (($ + commands[keychain])) >/dev/null 2>&1; then
  keychain --clear $HOME/.ssh/id_rsa
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Source Other Files                                              │
# ├─────────────────────────────────────────────────────────────────┤
# │ (!) Let Bash Variables come first to use within every area.     │
# │ (!) Load exports first                                          │
# └─────────────────────────────────────────────────────────────────┘
# For private exports [Don't place in git]
[[ -f ~/.bash_var ]] && source ~/.bash_var
[[ -f ~/.bash_alias ]] && source ~/.bash_alias
[[ -f ~/.bash_vendor ]] && source ~/.bash_vendor
[[ -f ~/.bash_help ]] && source ~/.bash_help


# ┌─────────────────────────────────────────────────────────────────┐
# │ Terminal Display                                                │
# └─────────────────────────────────────────────────────────────────┘
# https://bashrcgenerator.com/
#export PS1="[\[\033[0m\]\[\033[0;94m\]\w\[\033[0m\]] \[\033[0m\]\[\033[0;93m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\033[0m\]\n\u@\h-> \[\033[0m\]"
# Without color
#export PS1="[\w]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n\u@\h-> \[\033[0m\]"
export PS1="[$IBLUE\w$RESET]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/($IYELLOW\1$RESET)/')\n\u@\h-> "
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
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

# Fix $ cd typing errors
shopt -s cdspell


# Make 'less' friendlier for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

