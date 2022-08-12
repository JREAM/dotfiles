#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASHRC                                                          ║
# ╚═════════════════════════════════════════════════════════════════╝

# Debug any problems
_DEBUG="off"
function DEBUG() {
  if [ "$_DEBUG" == 'on' ]; then
     $@
    PS4='+${LINENO}: $0 | '
  fi
}

DEBUG echo 'DEBUG MODE ENABLED'
DEBUG set -x

# Disable Middle Mouse Button
# (!) Find by running: $ xinput
if [ $XDG_SESSION_TYPE != 'wayland' ]; then
  if [ $("xinput | grep Elan 2> /dev/null") ]; then
    xinput set-button-map 'Elan Touchpad' 1 0 3 4 5 6 7
  fi
fi

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
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

# Fix $ cd typing errors
shopt -s cdspell


# Make 'less' friendlier for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
