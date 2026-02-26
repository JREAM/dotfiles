#!/bin/bash
# shellcheck disable=SC1090,SC2086,SC1091
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASH_VENDORS                                                    ║
# ╚═════════════════════════════════════════════════════════════════╝

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Flutter JDK                                                        ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]       flutter
if [ -d $XDG_LIB_HOME/flutter ]; then
  export PATH="$XDG_LIB_HOME/flutter/bin:$PATH"
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Java JDK                                                        ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]       default-jdk default-jre
# [Locate]    $ readlink -f `which javac` | sed "s:/bin/javac::"
# [Notes]     Java is always a symbolic link using update-alternatives
if [ -L /usr/bin/java ]; then
  export PATH=$PATH:$JAVA_HOME/bin
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Dotnet JDK                                                      ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]       dotnet-install.sh
# [Notes]     wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
#             chmod +x ./dotnet-install.sh && ./dotnet-install.sh
#             (See ~/.dotnet folder)
if [ -d $HOME/.dotnet ]; then
  export DOTNET_ROOT=$HOME/.dotnet
  if [ -d $DOTNET_ROOT/tools ]; then
    export PATH=$PATH:$DOTNET_ROOT/tools
  fi
  if [ -f $DOTNET_ROOT/dotnet ]; then
    alias dotnet=$DOTNET_ROOT/dotnet
  fi
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║  Rust Language                                                  ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]     Rust
# [Install] curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
[ -f $XDG_DATA_HOME/cargo/env ] && . $XDG_DATA_HOME/cargo/env
[[ -d $XDG_DATA_HOME/cargo/bin ]] && export PATH=$PATH:$XDG_DATA_HOME/cargo/bin

# ╔═════════════════════════════════════════════════════════════════╗
# ║  Bun (Node)                                                     ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]     Bun (Node alternative)
# [Install] curl -fsSL https://deno.land/install.sh | sh
# ───────────────────────────────────────────────────────────────────
[[ -d "$HOME/.bun/bin" ]] && export PATH="$HOME/.bun/bin:$PATH"

# ╔═════════════════════════════════════════════════════════════════╗
# ║  Deno (Node)                                                     ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]     Deno (Node alternative)
# [Install] curl -fsSL https://deno.land/install.sh | sh
# ───────────────────────────────────────────────────────────────────
[[ -f "$HOME/.deno/env" ]] && . "$HOME/.deno/env"

# ╔═════════════════════════════════════════════════════════════════╗
# ║  pnpm (Phantom NPM) (NPM Alternative                           ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]       https:/pnpm.io
# [Install]   curl -fsSL https://get.pnpm.io/install.sh | sh -
# [Use]       $ pnpm -h
if [ -d $HOME/.local/share/pnpm ]; then
  export PNPM_HOME=$XDG_DATA_HOME/pnpm
  export PATH="$PNPM_HOME:$PATH"
  alias pn=pnpm
  alias px=pnpx
fi

alias lzd='lazydocker'

# ╔═════════════════════════════════════════════════════════════════╗
# ║  GoLang                                                         ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]       https://go.dev/
# [Install]   Download @ https://go.dev/dl/
# [Use]       $ go -h
if [ -d /usr/local/go ]; then
  # Do GO development in $GOPATH
  export GOPATH=$XDG_DATA_HOME/go
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$GOPATH/bin
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║  Turso / SQLite                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Desc]:     Installs to defalt location, remap to alias
# [Install]:  $ curl -sSfL https://get.tur.so/install.sh | bash
# [Usage]:    $ turso auth login
if [ -d $HOME/.turso ]; then
  alias turso=$HOME/.turso/turso
  alias sqld=$HOME/.turso/sqld
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║  Python / PyEnv                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
# Stop generating bytecode files
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"

# Pipx is for installing python commands (not packages)
# ───────────────────────────────────────────────────────────────────
# [Pkg]   pip install pipx
if [ -x $HOME/.local/bin/pipx ]; then
  eval "$(register-python-argcomplete pipx)"
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║  Composer / PHP                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
[ -d $XDG_CONFIG_HOME/composer/vendor/bin ] && PATH=$PATH:$XDG_CONFIG_HOME/composer/vendor/bin

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Bash Helpers                                                    ║
# ╚═════════════════════════════════════════════════════════════════╝

# ───────────────────────────────────────────────────────────────────
#  GRC (Bash Color Highlights)
# ───────────────────────────────────────────────────────────────────
# [Pkg]     apt install grc
# [Toggle]  sudo sed -i 's/^GRC_ALIASES.*/GRC_ALIASES=true/' /etc/default/grc
export GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/profile.d/grc.sh

# ───────────────────────────────────────────────────────────────────
# Better concat (cat) function  with colors
# ───────────────────────────────────────────────────────────────────
# [Pkg]   https://github.com/sharkdp/bat
# [Use]   $ batcat -h
if type batcat >/dev/null 2>&1; then
  # --plain for no line numbers
  # --paging never (because I can't copy/paste so nicely)
  alias bat='batcat --plain --paging=never'
  export BAT_THEME="Monokai Extended Origin"

  # Use bat alias w/settings over cat
  cat() {
    bat $1
  }
fi

# ───────────────────────────────────────────────────────────────────
# FZF Fuzzy Finder (Very Powerful Tool)
# ───────────────────────────────────────────────────────────────────
# [Pkg]   https://github.com/junegunn/fzf
#         git clone instead of apt for working version

# [Use]   $ fzf
#         $ cat anyfile | fzf
#         <ALT> + C   Fuzzy Directory Jump
#         <CTRL> + R  History Fuzzy Search
# Set Alias for fd before FZF
[ -x /usr/bin/fdfind ] && alias fd='fdfind'

[ -d "$HOME/.fzf/bin" ] && export PATH=$PATH:$HOME/.fzf/bin

if [ -x $HOME/.fzf/bin/fzf ]; then
  export FZF_DEFAULT_OPTS="
    --height 40% --layout=reverse --info=inline --margin=0 --padding=0 --border=rounded --tabstop=4
    --color=fg:#a9b7c6,bg:#282c34,hl:#ff6188,fg+:#a9b7c6,bg+:#3e4451,hl+:#ff6188,info:#fc9867,prompt:#ab9df2,pointer:#ff6188,marker:#a9dc76,spinner:#ffd866,header:#78dce8
    "

  #fg+:#a9b7c6,bg+:#3e4451,hl+:#ff6188
  #--color info:#fc9867,prompt:#ab9df2,pointer:#ff6188,marker:#a9dc76,spinner:#ffd866,header:#78dce8

  # To use a File
  #export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzfrc"
  export FZF_COMPLETION_TRIGGER=".."
  export FZF_DEFAULT_COMMAND="fdfind . $HOME --type f --exclude .git,node_modules"
  export FZF_ALT_C_COMMAND="fdfind -t d . $HOME"

  export FZF_ALT_C_OPTS="
      --color header:italic
      --header 'Change Directory'"

  # CTRL T is for making new tabs not this.
  export FZF_CTRL_T_OPTS="
      --walker-skip .git,node_modules,target
      --preview 'bat -n --color=always {}'
      --color header:italic
      --header 'File Widget'"

  _fzf_comprun() {
    local command=$1
    shift
    case "$command" in
    cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
    *) fzf "$@" ;;
    esac
  }

  # FZF Advanced w/RipGrep
  # ripgrep->fzf->vim [QUERY]
  ff() (
    RELOAD='reload:rg --column --color=always --smart-case {q} || :'
    OPENER="if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
              vim {1} +{2}     # No selection. Open the current line in Vim.
            else
              vim +cw -q {+f}  # Build quickfix list for the selected items.
            fi"
    fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
  )

fi

# ───────────────────────────────────────────────────────────────────
# Tre-Command
# [Pkg]   apt install tre--comand
# [Use]   tre-command (Or, replaced with $ tree here)
# ───────────────────────────────────────────────────────────────────
command -v tre >/dev/null && alias tree='tre'

# ───────────────────────────────────────────────────────────────────
# DirEnv
# [Pkg]   apt install direnv
# [Use]   Create a .envrc file
#         $ direnv allow
# ───────────────────────────────────────────────────────────────────
[ -x /usr/bin/direnv ] && eval "$(direnv hook bash)"
