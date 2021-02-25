# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

source $HOME/.bashrc

# ┌─────────────────────────────────────────────────────────────────┐
# │ Fix: compdef if not exists                                      │
# └─────────────────────────────────────────────────────────────────┘
if (!( $+commands[compdef] )) >/dev/null 2>&1; then
  alias compdef='1 >/dev/null'
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Final Export                                                    │
# └─────────────────────────────────────────────────────────────────┘
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH
