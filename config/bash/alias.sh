#!/bin/bash
# shellcheck disable=SC2086,SC2032,SC2033,SC2142
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASH_ALIASES                                                    ║
# ╚═════════════════════════════════════════════════════════════════╝
#  (!) .bash_alias is sourced from .bashrc

# ┌─────────────────────────────────────────────────────────────────┐
# │ Personal Shortcuts                                              │
# └─────────────────────────────────────────────────────────────────┘
[ -d $HOME/Downloads ] && alias dl='cd $HOME/Downloads'
[ -d $HOME/Dropbox ] && alias db='cd $HOME/Dropbox'

alias bashdir='cd $XDG_CONFIG_HOME/bash'
alias vimedit='vim $XDG_CONFIG_HOME/vim/vimrc'

# Update VScode permissions for custom css ui when updating
function vsconfig-update {
  sudo chown -R "$(whoami)" "$(which code)"
  sudo chown -R "$(whoami)" "$(which code-insiders)"
  sudo chown -R "$(whoami)" /usr/share/code
  sudo chown -R "$(whoami)" /usr/share/code-insiders
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ Apply colors as much as possible                                │
# └─────────────────────────────────────────────────────────────────┘
COLORIZE=""
[ -f /usr/bin/grc ] &>/dev/null && COLORIZE='grc'
export GREP_COLOR='1;32'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Apt Package Manager                                             │
# └─────────────────────────────────────────────────────────────────┘
alias apt='sudo apt'
alias autoclean='apt autoclean'
alias autoremove='apt autoremove'
alias clean='autoremove && autoclean'
alias ppa='sudo apt-add-repository'
alias update='sudo apt update'
alias updatey='update && apt upgrade -y && clean'
alias upgrade='sudo apt upgrade'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Common                                                          │
# └─────────────────────────────────────────────────────────────────┘
alias sudo='sudo '   # (1) Place above other sudo commands to enable aliases to be sudo-ed.
alias root='sudo -i' # Become root
alias su='sudo -i'   # Become root

alias www='cd /www'

alias path='echo $PATH | tr ":" "\\n" | sort | uniq -c' # Print PATH with counts

# Projects
alias p='cd ${HOME}/projects 2>/dev/null || cd /server/projects 2>/dev/null'

alias h='history'
alias c='clear'
alias j='jobs -l'
alias left='ls -t -1' # See where I last left off

alias nv=nvim         # neovim
alias vi=vim          # vim
alias vims='sudo vim' # sudo mode vim

alias reload='source $HOME/.bashrc; [[ -f $HOME/.xinitrc ]] && . $HOME/.xinitrc'
alias reloadtp='sudo /usr/bin/udevadm trigger'

alias permissions-octal='stat -c \"%a %n\" -- $1'

# Copy contents to /etc/network/if-up.d/sshfs-mount

alias sshreload='eval `ssh-agent` && ssh-add ~/.ssh/id_rsa'
alias mountserver='sudo sshfs jesse@10.10.10.200:/server /server -o ControlMaster=yes,reconnect,allow_other,workaround=rename,idmap=user,uid=1000,gid=1000,IdentityFile=/home/jesse/.ssh/server-local,Cipher=arcfour,compression=no'
alias umountserver='sudo umount -lf /server'

# Laravel Sail
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Check GPU in Use
alias gpu='
if [ "$XDG_SESSION_TYPE" = "x11" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "--- Running in Graphical Session (using glxinfo) ---"
    glxinfo | grep -E "OpenGL vendor|OpenGL renderer"
else
    echo "--- Running in Console/TTY Session (using lspci) ---"
    lspci -nnk | grep -i vga -A3
fi
'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Navigation                                                      │
# └─────────────────────────────────────────────────────────────────┘
alias -- -='cd -' # Tells bash to use - as argument
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'

alias l="ls --color=auto"
alias la="ls -lah --color=auto" # Horizontal List
alias ll="ls -lah --color=auto" # Long/Vertical List
alias ls="ls --color=auto "
alias l.="ls -d .* --color=auto | column -s='\n'" # List Hidden files
alias lh="l. --color=auto"                        # <List Hidden Files>; Alias for Alias
alias ll.="ls -lhd .* --color=auto"               # Long List Hiddent
alias llh="ll. --color=auto"                      # <List Hiddent Files; Alias for Alias

# ┌─────────────────────────────────────────────────────────────────┐
# │ Copy / Get / Remove                                             │
# └─────────────────────────────────────────────────────────────────┘
alias cpv='rsync -ah --info=progress2'                         # Progress bar'
alias findfile="find . -name "                                 # Make find a little easier
alias mkdir='mkdir -pv'                                        # $ mkdir x/y/z
alias rm='rm -I --preserve-root'                               # Prompt if deleting more than 3 files at a time
alias wget="wget -c - --hsts-file='$XDG_CACHE_HOME/wget-hsts'" # Resume if failed by default
alias xclip='xclip -sel clip'                                  # Copy to Clipboard $ cat file.txt | xclip
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"

alias mvdirs="find . -type d -maxdepth 1 ! -name "." -exec mv {} $1 \; " # Move directories first levle only
alias trash="gio trash"                                                  # Movies file to trash rather than permanently remove

# ┌─────────────────────────────────────────────────────────────────┐
# │ Grep                                                            │
# └─────────────────────────────────────────────────────────────────┘
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Count                                                            │
# └─────────────────────────────────────────────────────────────────┘
# Find all directories and count files within them, then sort by count descending
function count_most_files() {
  find . -type d -print0 | while IFS= read -r -d $'\0' dir; do
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    echo "$file_count $dir"
  done | sort -nr | awk '{print $2 ": " $1 " files"}'
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ Permissions / Ownership                                         │
# └─────────────────────────────────────────────────────────────────┘
alias chgrp='sudo chgrp --preserve-root'
alias chmod='sudo chmod --preserve-root'
alias chmox='sudo chmod --preserve-root' # I always make this typo
alias chown='sudo chown --preserve-root'

alias gnome-version='gnome-shell --version'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Services                                                        │
# └─────────────────────────────────────────────────────────────────┘
alias service='sudo service'
alias systemctl='sudo systemctl'

alias poweroff='sudo /sbin/poweroff'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
alias gtkversion='gtk-launch --version'

# ┌─────────────────────────────────────────────────────────────────┐
# │ PBCopy/Paste Linux Version                                      │
# └─────────────────────────────────────────────────────────────────┘
alias pbcopy='xsel — clipboard — input'
alias pbpaste='xsel — clipboard — output'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Ping / IP / Network                                             │
# └─────────────────────────────────────────────────────────────────┘
alias fastping='ping -c 100 -s.2'
alias myip="curl -s https://checkip.amazonaws.com"
alias myips="hostname -I"
alias iplist='sudo $COLORIZE /sbin/iptables -L -n -v --line-numbers'
alias iptlistfw='sudo $COLORIZE /sbin/iptables -L FORWARD -n -v --line-numbers'
alias iptlistin='sudo $COLORIZE /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo $COLORIZE /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias ping='ping -c 5' # Send X packets
alias ports="netstat -tulanp"

function portcheck() {
  if [ -z $1 ]; then
    echo -e "[!] You must pass a port number, such as 1234"
    return 0
  fi
  sudo lsof -i :$1
}

alias filesystem-reload='sudo systemctl start remote-fs.target local-fs.target && sudo systemctl daemon-reload' # FStab, mount -a doesn't work
alias fsreload="filesystem-reload"
alias fontreload='fc-cache -f'

function convertgpgkey() {
  if [ -z $1 ]; then
    echo -e "[!] You must pass a file, such as filename.asc"
    return 0
  fi
  if [ ! -f $1 ]; then
    echo -e "[!] The first argument must be a file."
  fi

  echo -e "[+] Example downloading to file:"
  echo -e "wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc > server-6.0.asc"
  echo -e "cat server-6.0.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mongodb-org-6.0.gpg | > /dev/null 2&1"
  cat $1 | grg --dearmor >"${1%.*}.gpg" # New File Name
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ HDD Related                                                     │
# └─────────────────────────────────────────────────────────────────┘
alias df='df -H | grep -v "/snap"' # Excloude /snap directories
alias du='du -ch'                  # Disk Usage
alias mount='mount | column -t'
alias most='du -hsx * | sort -rh | head -10'
alias usage='du -ch | grep total'
alias totalusage='df -hl --total | grep total'

# ┌─────────────────────────────────────────────────────────────────┐
# │ CPU / Memory Related                                            │
# └────────────────────────────────────────────────────────────────┘
alias pscpu="ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"

# ┌─────────────────────────────────────────────────────────────────┐
# │ SSH                                                             │
# └─────────────────────────────────────────────────────────────────┘
alias ssh-fingerprint='ssh-keygen -lf $1'
alias ssh-permissions='chown -R $USER:$USER ~/.ssh && \
  chmod 700 ~/.ssh && \
  chmod 600 ~/.ssh/* && \
  chmod 644 ~/.ssh/{*.pub,config,known_hosts}'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Hardware Info                                                   │
# └─────────────────────────────────────────────────────────────────┘
hardware() { sudo dmidecode -t "$1"; }

alias hw-bios='hardware bios'
alias hw-cache='hardware cache'
alias hw-chassis='hardware chassis'
alias hw-connector='hardware connector'
alias hw-cpu='hardware processor'
alias hw-memory='hardware memory'
alias hw-motherboard='hardware baseboard'
alias hw-slot='hardware slot'
alias hw-system='hardware system'

function font-install {
  mkdir -p ~/.local/share/fonts
  cp ./*.{ttf,otf} ~/.local/share/fonts
  fc-cache -fv
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ Utility Packages                                                │
# └─────────────────────────────────────────────────────────────────┘
# [Pkg]     apt install tre-command
[ -f /usr/bin/tre ] && alias tree="tre"

# [Pkg]     apt install colordiff
[ -f /usr/bin/colordiff ] && alias diff='colordiff'

# [Pkg]     apt install nmap
[ -f /usr/bin/nmap ] && alias portsopen='nmap localhost --open'

# [Pkg]     npm i -g vtop
# Directory can change w/NVM Versions so check: -x
[ -x "$(command -v vtop)" ] &>/dev/null && alias top="vtop"

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Python                                                          ║
# ╚═════════════════════════════════════════════════════════════════╝
alias py='python'

# ╔═════════════════════════════════════════════════════════════════╗
# ║ MySQL                                                           ║
# ╚═════════════════════════════════════════════════════════════════╝
alias mysqlvars="mysql -NBe 'SHOW VARIABLES'| sed 's,\t,^=,' | column -ts^"

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Fix apt Legacy Keys                                             ║
# ╚═════════════════════════════════════════════════════════════════╝
# >> Get the Repository file size
function fix-apt-legacy-keys() {
  for KEY in $(apt-key list | grep -E "(([ ]{1,2}(([0-9A-F]{4}))){10})" | tr -d " " | grep -E "([0-9A-F]){8}\b"); do
    K=${KEY:(-8)}
    apt-key export $K | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/imported-from-trusted-gpg-$K.gpg
  done
}

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Git Alaias (Also see .gitconfig [alias])                        ║
# ╚═════════════════════════════════════════════════════════════════╝
# >> Get the Repository file size
git-filesize() {
  git rev-list --objects --all |
    git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
    sed -n 's/^blob //p' |
    sort -n -k2 |
    cut -c 1-12,41- |
    $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
}

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Docker Aliases                                                  ║
# ╚═════════════════════════════════════════════════════════════════╝
docker-compose-from-container() {
  docker pull ghcr.io/red5d/docker-autocompose:latest
  echo -e "\n [ START: output $([[ -z $1 ]] && echo 'single' || echo 'all') running container ]"
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/red5d/docker-autocompose ${1:-$(docker ps -aq)}
  echo -e "\n [ END: output $([[ -z $1 ]] && echo 'single' || echo 'all') running containers ]"
}

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Archive Aliases                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
# >> Compress contents into a <name>tar.gz
compress() {
  [[ -z $1 ]] && {
    echo "Usage: compress <name>.tar.gz <folder|file>"
    return 1
  }
  tar -cvzf "${1%.*}.tar.gz" "$2"
}

# ╔═════════════════════════════════════════════════════════════════╗
# ║ File Aliases                                                    ║
# ╚═════════════════════════════════════════════════════════════════╝
# >> Find a list of the 20 largest files
ls-largest() {
  du -h -x -s -- * | sort -r -h | head -20
}

# >> Show the LATEST file in current directory
ls-latest() {
  find "${1:-.}" -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" "
}

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Get XDG Paths                                                   ║
# ╚═════════════════════════════════════════════════════════════════╝

alias xdg-data-home='cd $XDG_DATA_HOME'
alias xdg-config-home='cd $XDG_CONFIG_HOME'
alias xdg-cache-home='cd $XDG_CACHE_HOME'
alias xdg-state-home='cd $XDG_STATE_HOME'
alias xdg-mv-share='mkdir-p $XDG_DATA_HOME/share/$1 && mv $1 $XDG_DATA_HOME/share/$1'

xdg() {
  # Header with border using Unicode box-drawing characters, bright orange
  echo -e "\033[1;38;5;208m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
  echo -e "┃   \$XDG Environment Variables        ┃"
  echo -e "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"

  # Print the environment variables, sorted alphabetically
  printenv | grep '^XDG_' | sort | awk '{
      firstEq = index($0, "=");
      varName = substr($0, 1, firstEq - 1);
      varValue = substr($0, firstEq + 1);

      if (index(varValue, ":") > 0) {
          n = split(varValue, paths, ":");
          printf("\033[1;33m%s\033[0m\033[38;5;208m=\033[0m\n", varName); # Bold name, reset, orange =
          for (i = 1; i <= n; i++) {
              printf("    \033[37m%s\033[0m\n", paths[i]);  # No bold on paths
          }
      } else {
          printf("\033[1;33m%s\033[0m\033[38;5;208m=\033[0m\033[37m%s\033[0m\n", varName, varValue); # Bold name, reset, orange =, white value, reset
      }
  }'
}

alias xdg_cache='cd $XDG_CACHE_HOME'
alias xdg_config='cd $XDG_CONFIG_HOME'
alias xdg_data='cd $XDG_DATA_HOME'
alias xdg_rintime='cd $XDG_RUNTIME_DIR'
alias xdg_state='cd $XDG_STATE_HOME'

#!/bin/bash

xdg_config_dirs() {
  local selected_index=1
  local paths=()
  local IFS=":"
  local selected_path

  # Read XDG_CONFIG_DIRS into an array, handling empty variable
  if [ -z "$XDG_CONFIG_DIRS" ]; then
    paths=("$HOME/.config") # Default to $HOME/.config if empty
  else
    read -r -a paths <<<"$XDG_CONFIG_DIRS"
  fi

  if command -v fzf &>/dev/null; then
    # Use fzf for selection
    selected_path=$(printf "%s\n" "${paths[@]}" | fzf --prompt="Go to XDG_CONFIG_DIRS path: " --height 40% --layout=reverse --border)

    if [[ -n "$selected_path" ]]; then
      cd "$selected_path" || {
        echo "Error: Could not change directory to $selected_path."
        read -r -p "Press Enter to continue..." # Wait for user input
        return 1
      }
    fi
  else
    # Fallback to manual selection (arrow keys)
    while true; do
      clear

      # Display header
      echo -e "\033[1;38;5;208mSelect an XDG_CONFIG_DIRS path (Up/Down to navigate, Enter to select, q to quit):\033[0m"

      # Display paths with selection indicator
      for i in "${!paths[@]}"; do
        if [[ "$i" -eq "$((selected_index - 1))" ]]; then
          echo -e "  \033[1;34m> ${paths[$i]}\033[0m" # Highlight selected path
        else
          echo "    ${paths[$i]}"
        fi
      done

      # Read user input (arrow keys and Enter)
      read -r -s -n 3 key

      case "$key" in
      $'\x1b[A') # Up arrow
        ((selected_index > 1)) && ((selected_index--))
        ;;
      $'\x1b[B') # Down arrow
        ((selected_index < ${#paths[@]})) && ((selected_index++))
        ;;
      $'\x0a') # Enter key (Line Feed)
        # Change directory to the selected path
        cd "${paths[$((selected_index - 1))]}" || {
          echo "Error: Could not change directory to ${paths[$((selected_index - 1))]}."
          read -r -p "Press Enter to continue..." # Wait for user input
        }
        return # Exit the function
        ;;
      q) #Quit
        return
        ;;
      esac
    done
  fi
}

xdg_data_dirs() {
  local selected_index=1
  local paths=()
  local IFS=":"
  local selected_path

  # Read XDG_DATA_DIRS into an array, handling empty variable
  if [ -z "$XDG_DATA_DIRS" ]; then
    paths=("/usr/local/share/" "/usr/share/")
  else
    read -r -a paths <<<"$XDG_DATA_DIRS"
  fi

  if command -v fzf &>/dev/null; then
    # Use fzf
    selected_path=$(printf "%s\n" "${paths[@]}" | fzf --prompt="Go To XDG_DATA_DIRS path: " --height 40% --layout=reverse --border)

    if [[ -n "$selected_path" ]]; then
      cd "$selected_path" || {
        echo "Error: could not change directory to $selected_path"
        read -p "Press Enter to continue..."
        return 1
      }
    fi
  else
    # fallback
    while true; do
      clear

      # Display header
      echo -e "\033[1;38;5;208mSelect an XDG_DATA_DIRS path (Up/Down to navigate, Enter to select, q to quit):\033[0m"

      # Display paths with selection indicator
      for i in "${!paths[@]}"; do
        if [[ "$i" -eq "$((selected_index - 1))" ]]; then
          echo -e "  \033[1;34m> ${paths[$i]}\033[0m" # Highlight selected path
        else
          echo "    ${paths[$i]}"
        fi
      done

      # Read user input (arrow keys and Enter)
      read -r -s -n 3 key

      case "$key" in
      $'\x1b[A') # Up arrow
        ((selected_index > 1)) && ((selected_index--))
        ;;
      $'\x1b[B') # Down arrow
        ((selected_index < ${#paths[@]})) && ((selected_index++))
        ;;
      $'\x0a') # Enter key (Line Feed)
        # Change directory to the selected path
        cd "${paths[$((selected_index - 1))]}" || {
          echo "Error: Could not change directory to ${paths[$((selected_index - 1))]}."
          read -r -p "Press Enter to continue..." # Wait for user input
        }
        return # Exit the function
        ;;
      q)
        return
        ;;
      esac
    done
  fi
}
