# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# @IMPORTANT - Do not use .bash_profile or this is ignored
#              ~/.profile allows other shells to use the same format

# ┌─────────────────────────────────────────────────────────────────┐
# │ XDG Directory Paths                                             │
# └─────────────────────────────────────────────────────────────────┘
# # [Spec]    https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# ───────────────────────────────────────────────────────────────────
export XDG_CONFIG_HOME=$HOME/.config     # Config Files
export XDG_DATA_HOME=$HOME/.local/share  # Shared Data
export XDG_STATE_HOME=$HOME/.local/state # Actions History, Logs, Recent Files
export XDG_CACHE_HOME=$HOME/.cache
# [Example]   $HOME/.config/bash_completions
#             $HOME/.comfig/curl/curlrc

# ┌─────────────────────────────────────────────────────────────────┐
# │ Set Correct Paths                                               │
# └─────────────────────────────────────────────────────────────────┘
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export VIMINIT="let $MYVIMRC=\"$XDG_CONFIG_HOME/vim/vimrc\"|| source $MYVIMRC"

export PYLINTHOME="$XDG_CACHE_HOME"/pylint,
export PYLINTRC="$XDG_CONFIG_HOME"/pylint/pylintrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

export GNUPGHOME=$XDG_DATA_HOME/gnupg
export CARGO_HOME=$XDG_DATA_HOME/cargo
export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"

# NPM (Uncertain on how effective)
# see npm config ls -l | grep /
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm

#GOPATH set in .bash_vendor

# ┌─────────────────────────────────────────────────────────────────┐
# │ If Bash; Load .bashrc                                           │
# └─────────────────────────────────────────────────────────────────┘
if [ -n "$BASH_VERSION" ]; then
  [ -f ~/.bashrc ] && source $HOME/.bashrc
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
