# this is the bare bones setup to move everything to XDG dir
ZDOTDIR=$XDG_CONFIG_HOME/zsh
export TERM=xterm-256color

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

