#!/bin/bash

# ~/.profile: executed by the command interpreter for login shells.

# See /usr/share/doc/bash/examples/startup-files for examples.
# - the files are located in the bash-doc package.
# - the default umask is set in /etc/profile; for setting the umask
# - for ssh logins, install and configure the libpam-umask package.
# $ umask 022

# @IMPORTANT - Do not use .bash_profile or this is ignored
#              ~/.profile allows other shells to use the same format

# ┌─────────────────────────────────────────────────────────────────┐
# │ XDG Directory Paths                                             │
# └─────────────────────────────────────────────────────────────────┘
#  [Spec]    https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# [Example]   $HOME/.config/bash_completions
#             $HOME/.comfig/curl/curlrc
# ───────────────────────────────────────────────────────────────────
export XDG_CONFIG_HOME=$HOME/.config     # Config Files
export XDG_DATA_HOME=$HOME/.local/share  # Shared Data
export XDG_STATE_HOME=$HOME/.local/state # Actions History, Logs, Recent Files
export XDG_CACHE_HOME=$HOME/.cache
export XDG_LIB_HOME=$HOME/.local/lib # For SDKs, (Custom)

# ┌─────────────────────────────────────────────────────────────────┐
# │ Set Correct Paths                                               │
# └─────────────────────────────────────────────────────────────────┘
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"

# ┌─────────────────────────────────────────────────────────────────┐
# │ RC Files                                                        │
# └─────────────────────────────────────────────────────────────────┘
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# ┌─────────────────────────────────────────────────────────────────┐
# │ Vendors                                                         │
# └─────────────────────────────────────────────────────────────────┘
export CARGO_HOME=$XDG_DATA_HOME/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME=$XDG_DATA_HOME/gnupg
#export PYLINTHOME="$XDG_CACHE_HOME"/pylint,
#export PYLINTRC="$XDG_CONFIG_HOME"/pylint/pylintrc
#export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
#GOPATH set in .bash_vendor

# Use $XDG_CONFIG_HOME for Vendirs

# ┌─────────────────────────────────────────────────────────────────┐
# │ If Bash; Load .bashrc                                           │
# └─────────────────────────────────────────────────────────────────┘
if [ -n "$BASH_VERSION" ]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Ensure user-specific executable are in $PATH                    │
# └─────────────────────────────────────────────────────────────────┘
[ -d ~/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

# ┌─────────────────────────────────────────────────────────────────┐
# │ Fix: compdef if not exists                                      │
# └─────────────────────────────────────────────────────────────────┘
if ( ! ($+commands[compdef])) >/dev/null 2>&1; then
  alias compdef='1 >/dev/null'
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Autoload X11 Touchpad Options                                   │
# └─────────────────────────────────────────────────────────────────┘
[ -f $HOME/.xinitrc ] && . $HOME/.xinitrc
. "$HOME/.deno/env"
. "$HOME/.local/share/cargo/env"
. "$HOME/.local/share/../bin/env"
