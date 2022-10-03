# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jesse/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jesse/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jesse/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jesse/.fzf/shell/key-bindings.bash"
