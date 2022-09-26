#!/bin/bash
# shellcheck disable=SC2086,SC2154,SC1091
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASHRC                                                          ║
# ║ @depends    .bash_alias                                         ║
# ║             .bash_var                                           ║
# ║             .bash_vendor                                        ║
# ╚═════════════════════════════════════════════════════════════════╝

# Detect: Interactive Mode
# Use to prevent incorrect TTY errors with some scripts
[ -v PS1 ] && i9e=true || i9e=false
export INTERACTIVE_MODE=$i9e

export PATH=$PATH:/home/$USER/.local/bin # Set: Local bin to $PATH
export BROWSER=/usr/bin/brave-browser    # Set: Local Browser (Affects: VSCode)

# XDG Directory Paths
# [Spec]    https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# ───────────────────────────────────────────────────────────────────
export XDG_CONFIG_HOME=$HOME/.config      # Config Files
export XDG_DATA_HOME=$HOME/.local/share   # Shared Data
export XDG_STATE_HOME=$HOME/.local/state  # Actions History, Logs, Recent Files
export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$XDG_CONFIG_HOME
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$XDG_DATA_HOME
# [Example]
# ~/.config/bash_completions
# ~/.config/zsh
# ~/.config/docker


# Autoload Keychain SSH ID
if (($ + commands[keychain])) >/dev/null 2>&1; then
  keychain --clear $HOME/.ssh/id_rsa --absolute --dir "$XDG_RUNTIME_DIR"/keychain
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Bash Includes                                                   │
# └─────────────────────────────────────────────────────────────────┘
# ╔═════════════════════════════════════════════════════════════════╗
# ║ Source Files: Bash Includes                                     ║
# ╠═════════════════════════════════════════════════════════════════╣
# ║ (1) .bash_var comes first                                        ║
# ║ (2) .bash_vendor come second (incase of alias-ing)              ║
# ║ (3) ...rest                                                     ║
# ╚═════════════════════════════════════════════════════════════════╝
# For private exports [Don't place in git]
[[ -f $HOME/.bash_var ]] && source $HOME/.bash_var
[[ -f $HOME/.bash_vendor ]] && source $HOME/.bash_vendor
[[ -f $HOME/.bash_alias ]] && source $HOME/.bash_alias

# ┌─────────────────────────────────────────────────────────────────┐
# │ Display: PS1 Prompt                                             │
# └─────────────────────────────────────────────────────────────────┘
# [Help]    https://bashrcgenerator.com/
# [NoColor] export PS1="[\w]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n\u@\h-> \[\033[0m\]"
IN_SSH=""
[[ -n $SSH_CLIENT ]] && IN_SSH="[${IBYELLOW}SSH$RESET]"
export PS1="$IN_SSH[$IBLUE\w$RESET]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/($IYELLOW\1$RESET)/')\n\u@\h-> "

# ┌─────────────────────────────────────────────────────────────────┐
# │ Shell Options                                                   │
# └─────────────────────────────────────────────────────────────────┘
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend # Append history file (Don't overwrite), must set HISTFILE
shopt -s cdspell    # Auto fix 'cd' command typos
shopt -s autocd     # Type in a folder name to auto CD into it

# Set variable identifying the chroot you work in
#                      (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Make 'less' friendlier for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ┌─────────────────────────────────────────────────────────────────┐
# │ Bash Completion                                                 │
# └─────────────────────────────────────────────────────────────────┘
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  source /usr/share/bash-completion/bash_completion

if [[ -d "$XDG_CONFIG_HOME/bash_completion" ]]; then
  for FILE in "$XDG_CONFIG_HOME/bash_completion/*"; do
    source $FILE;
  done
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Colorized 'man' Pages                                           │
# └─────────────────────────────────────────────────────────────────┘
# [Notes]   Colors from .bash_vars could be used here.
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


