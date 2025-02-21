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

alias dotfiles='cd $XDG_CONFIG_HOME/bash'

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

# Work
[ -d /server/work ] && alias w='cd /server/work'

# Docker
[ -d /docker ] && alias d='cd /docker'

# Projects
alias p='cd ${HOME}/projects 2>/dev/null || cd /server/projects 2>/dev/null'
alias s='cd ${HOME}/servers 2>/dev/null'
alias ws='cd ${HOME}/workspace 2>/dev/null'
alias t='cd ${HOME}/tmp 2>/dev/null || cd ${HOME}/test 2>/dev/null'

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

