# The following have to go in .zprofile, because they are used by
# macOS's /etc/zshrc file, which is sourced _before_ your`.zshrc`
# file.
export SHELL_SESSION_DIR=$XDG_STATE_HOME/zsh/sessions
export SHELL_SESSION_FILE=$SHELL_SESSION_DIR/$TERM_SESSION_ID
