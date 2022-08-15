#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASH_ALIASES                                                    ║
# ╚═════════════════════════════════════════════════════════════════╝
#  (!) bash_alias is sourced from .bashrc
#  (?) Suggested 'apt' Packages: pydf colordiff nmap


# ╔═════════════════════════════════════════════════════════════════╗
# ║ Personal Folders                                                ║
# ╚═════════════════════════════════════════════════════════════════╝
[ -d ~/projects ]  && alias p='cd ~/projects/'
[ -d ~/dev ]       && alias d='cd ~/dev/' && alias dev='cd ~/dev'
[ -d ~/Downloads ] && alias dl='cd ~/Downloads'
[ -d ~/work ]      && alias w='cd ~/work/'

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Try to use GRC Colorizer                                        ║
# ╚═════════════════════════════════════════════════════════════════╝
COLORIZE="" # Empty by default, used in variables
if [ -x "$(command -v grc)" &> /dev/null ]; then
  COLORIZE='grc'
fi


# ╔═════════════════════════════════════════════════════════════════╗
# ║ Bug Fix                                                         ║
# ╚═════════════════════════════════════════════════════════════════╝
# Fix "GREP OPTIONS depcrated"
#GREP_OPTIONS="$GREP_OPTIONS -r -d skip"
export GREP_COLOR='1;32'


# ╔═════════════════════════════════════════════════════════════════╗
# ║ Command Commands                                                ║
# ╚═════════════════════════════════════════════════════════════════╝
alias c='clear'
alias h='history'
alias j='jobs -l'

# Use the Latest Python Version via "py"
alias py='python'
alias ports="netstat -tulanp"
alias time="date +'%A, %B %m %Y at%l:%M%P %Z'"
alias vi=vim

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias www='cd /var/www/'

# Listing
alias l="ls -lh --color=auto"
alias la="ls -lah --color=auto"                   # Long List
alias ll="ls -lah --color=auto"                   # Long List
alias ls="ls --color=auto"
alias l.="ls -d .* --color=auto | column -s='\n'" # List Hidden files
alias lh="l."                                     # <List Hidden Files>; Alias for Alias
alias ll.="ls -lhd .* --color=auto"               # Long List Hiddent
alias llh="ll."                                   # <List Hiddent Files; Alias for Alias
alias os="lsb_release -a"                         # Get OS Version

# Utility
alias mkdir='mkdir -pv'             # $ mkdir x/y/z
alias wget="wget -c"                # Resume if failed by default
alias findfile="find . -name "      # Make find a little easier
alias xclip='xclip -sel clip'       # Copy to Clipboard $ cat file.txt | xclip

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Super User 'sudo' shortcuts
alias apt-get='sudo apt-get'
alias apt='sudo apt'
alias root='sudo -i'                # Become root
alias service='sudo service'
alias su='sudo -i'                  # Become root
alias sudo='sudo '                  # Enable aliases to be sudo-ed

# Sudo Permissions
alias chgrp='sudo chown --preserve-root'
alias chmod='sudo chmod --preserve-root'
alias chmox='sudo chmod --preserve-root'  # always make this typo
alias chown='sudo chown --preserve-root'

# Services
alias service='sudo service'
alias systemctl='sudo systemctl'

# Reboot Bypass Wait
alias poweroff='sudo /sbin/poweroff'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'

# System Updates
alias autoclean='sudo apt autoclean'
alias autoremove='clean'
alias clean='sudo apt autoremove; sudo apt autoclean'
alias ppa='sudo apt-add-repository'
alias update='sudo apt-get update'
alias updatey='sudo apt-get update && \
  sudo apt-get upgrade -y && \
  sudo apt autoremove -y && \
  sudo apt autoclean'
alias upgrade='sudo apt-get upgrade'

# Mount (Readable)
alias mount='mount | column -t'

# Ping / IP
alias fastping='ping -c 100 -s.2'
alias iplist="sudo $COLORIZE /sbin/iptables -L -n -v --line-numbers"
alias iptlistfw="sudo $COLORIZE /sbin/iptables -L FORWARD -n -v --line-numbers"
alias iptlistin="sudo $COLORIZE /sbin/iptables -L INPUT -n -v --line-numbers"
alias iptlistout="sudo $COLORIZE /sbin/iptables -L OUTPUT -n -v --line-numbers"
alias myip="curl -s https://checkip.amazonaws.com"
alias myips="hostname -I"
alias ping='ping -c 5'  # Send X packets

# Disk Related
alias df='df -H | grep -v "/snap"'  # Remove the snap directories
alias du='du -ch'

# SSH Related
alias ssh-permissions="chown -R $USER:$USER ~/.ssh; chmod -R 600 ~/.ssh; chmod -R 644 ~/.ssh/{*.pub,config,known_hosts}"

# Utility
alias permissions-octal="stat -c \"%a %n\" -- $1"

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Hardware Aliases                                                ║
# ╚═════════════════════════════════════════════════════════════════╝
alias hardware-bios='sudo dmidecode -t bios'
alias hardware-cache='sudo dmidecode -t cache'
alias hardware-chassis='sudo dmidecode -t chassis'
alias hardware-connector='sudo dmidecode -t connector'
alias hardware-cpu='sudo dmidecode -t processor'
alias hardware-memory='sudo dmidecode -t memory'
alias hardware-motherboard='sudo dmidecode -t baseboard'
alias hardware-slot='sudo dmidecode -t slot'
alias hardware-system='sudo dmidecode -t system'

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Vendor Aliases                                                  ║
# ╚═════════════════════════════════════════════════════════════════╝
if [ -x "$(command -v vtop)" &> /dev/null ]; then
  alias top="vtop"  # npm i -g vtop
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Common Install Shortcuts                                        ║
# ╚═════════════════════════════════════════════════════════════════╝
# install: $ sudo apt install colordiff
if hash colordiff 2>/dev/null; then
  alias diff='colordiff'
fi

# install: $ sudo apt install nmap
if hash nmap 2>/dev/null; then
  alias portsopen='nmap localhost --open'
fi


# ╔═════════════════════════════════════════════════════════════════╗
# ║ NGINX                                                           ║
# ╚═════════════════════════════════════════════════════════════════╝
function ngensite { sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled; }
function ngdissite { sudo rm /etc/nginx/sites-enabled/$1; }
alias ngaccess='tail -n 50 /var/log/nginx/access.log'
alias ngdisstartup='sudo service nginx stop && sudo update-rc.d nginx disable && echo "nginx set to NOT autostart"'
alias ngenstartup='sudo service nginx start && sudo update-rc.d nginx enable && echo "nginx set to autostart"'
alias nglog='tail -n 50 /var/log/nginx/error.log'
alias ngls-sites-en='ls /etc/nginx/sites-enabled'
alias ngls-sites='ls /etc/nginx/sites-available'
alias ngpath='cd /etc/nginx/'
alias ngreload='sudo service nginx reload'
alias ngrestart='sudo service nginx restart'
alias ngsites='cd /etc/nginx/sites-available'
alias ngstart='sudo service nginx start'
alias ngstatus='systemctl status nginx.service'
alias ngstop='sudo service nginx stop'
alias ngtest='sudo nginx -t'


# ╔═════════════════════════════════════════════════════════════════╗
# ║ Apache2                                                         ║
# ╚═════════════════════════════════════════════════════════════════╝
alias a2ls-mods-en='ls /etc/apache2/mods-enabled'
alias a2ls-mods='ls /etc/apache2/mods-available'
alias a2ls-sites-en='ls /etc/apache2/sites-enabled'
alias a2ls-sites='ls /etc/apache2/sites-available'

alias a2graceful='sudo /usr/sbin/apachectl -k graceful'
alias a2modules='sudo apachectl -t -D DUMP_MODULES'
alias a2path='cd /etc/apache2/'
alias a2reload='sudo service apache2 reload'
alias a2restart='sudo service apache2 restart'
alias a2start='sudo service apache2 start'
alias a2status='systemctl status apache2.service'
alias a2stop='sudo service apache2 stop'
alias a2test='sudo apachectl -t'
alias a2version='sudo apachectl -v'
alias a2vhosts='sudo apachectl -t -D DUMP_VHOSTS'

alias a2disconf='sudo a2disconf'
alias a2dismod='sudo a2dismod'
alias a2dissite='sudo a2dissite'
alias a2enconf='sudo a2enconf'
alias a2enmod='sudo a2enmod'
alias a2ensite='sudo a2ensite'
alias a2graceful='sudo a2graceful'
alias a2modules='sudo a2modules'

alias a2avs='cd /etc/apache2/sites-available'
alias a2ens='cd /etc/apache2/sites-enabled'

alias a2access='tail -n 50 /var/log/apache2/access.log'
alias a2log='tail -n 50 /var/log/apache2/error.log'

alias a2ctl='sudo apachectl'
alias apache2ctl='sudo apache2ctl'
alias apachectl='sudo apachectl'

function phpswitchver() {
  if [ -z $1 ]; then
    echo "You must provide a version number, eg: 7.4"
    return
  fi

  if [ -x "/usr/bin/php${1}" ]; then
    echo "[+] /usr/bin/php${1} exists, changing symlink"

    if [ -L /etc/alternatives/php ]; then
      sudo rm /etc/alternatives/php
    fi

    sudo ln -s "/usr/bin/php$1" /etc/alternatives/php

    hasApacheMod=$(ls -iq /etc/apache2/mods-available/php*.conf 2> /dev/null | wc -l)
    if [ $hasApacheMod -gt 0 ]; then
      sudo a2dismod php*
      sudo a2enmod php$1
      sudo systemctl restart apache2
    fi

  else
    echo "[!] /usr/bin/php${1} does not exist"
    versions=$(ls -m /etc/php)
    echo "[+] Available PHP versions: $versions"
  fi
}

alias mysqlvars="mysql -NBe 'SHOW VARIABLES'| sed 's,\t,^=,' | column -ts^"

# ╔═════════════════════════════════════════════════════════════════╗
# ║ PHP FPM                                                         ║
# ╚═════════════════════════════════════════════════════════════════╝
# PHPFPM_VERSION=8.0
# alias fpm-log="sudo tail /var/log/php$PHPFPM_VERSION-fpm.log"
# alias fpm-reenable="systemctl restart php$PHPFPM_VERSION-fpm.service"
# alias fpm-reload="systemctl reload php$PHPFPM_VERSION-fpm.service"
# alias fpm-restart="systemctl restart php$PHPFPM_VERSION-fpm.service"
# alias fpm-restart="systemctl restart php$PHPFPM_VERSION-fpm.service"
# alias fpm="sudo php$PHPFPM_VERSION-fpm"

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Git                                                             ║
# ╚═════════════════════════════════════════════════════════════════╝
# Prefer To type gitA<Tab> for quick update
alias gitAddPush="git add . && git cm 'Standard Update' && git push"
alias gitPush="git push"
alias gitPull="git pull"

# Git Checkout Directory(ies) only
# git_sparse_clone "http://github.com/tj/n" "./local/location" "/bin"
function gitCloneDir() {
  remoteUrl="$1"
  localDir="$2"
  depth="$3"

  if [ -z "$2" ]; then
    echo "[!] Please run: gitCloneDir <https://github.com/user/folder> <./localDir> <optional: depth (default: 1)>"
    return
  fi

  if [ -z "$3" ]; then
    depth=1
  fi

  if [ !-d "$d" ]; then
    mkdir $d;
  fi

  git clone \
    --depth $depth  \
    --filter=blob:none  \
    --sparse \
    $remoteUrl
    https://github.com/cirosantilli/test-git-partial-clone;
}


# ╔═════════════════════════════════════════════════════════════════╗
# ║ Custom Functions                                                ║
# ╚═════════════════════════════════════════════════════════════════╝

# >> Find in file
#
# examples:  $ findinfile 'hello mom' .
#            $ fif 'hello mom' .
# ___________________________________________________________________
function findinfile() {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: findinfile <text|text2> <path (defaults to \$PWD>"
    return
  fi

  if [ -z "$2" ]; then
    local search_path=$PWD
  else
    search_path=$2
  fi

  grep -Elir "(${1}) ${search_path}"
}

alias fif="findinfile"

alias slugifydir="slugify -vud . && rename 'y/A-Z/a-z/' ."

# >> Directory Loop
#    (All Children/Sub-Folders)
#
#   @TODO [ON HOLD, SEE BELOW] PASS -d=2 or --depth=<number> to allow over 1 level deep
#
# examples: $ loopdir git checkout development
# ___________________________________________________________________
loopdir() {
    if [ -z "$1" ]; then
        echo -e "[!] Error: Provide a command to run."
        echo -e "[!] $ loopdircmd <command here>\n"
        return
    fi

    # $* joins all arguments as a string
    echo "$*"

    # Go One Level Deep
    # @TODO Using this right now for CWD OUTPUT
    for d in ./*/; do
        echo -e "\n$d"
        (cd "$d" && $*);
    done

    # @TODO: This works great, but I'd like to print out the directory im in better
    # -name . skips running from the CWD
    # find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && echo -e \"\n${BOLD}${GREEN}In Directory: ${PWD}${RESET}\" && $*" \;
}

# >> Extract Files with one function <@DS>
# ___________________________________________________________________
extract () {
  if [ -f $1 ]; then
    case $1 in
      *.7z)       7z x       $1 ;;
      *.bz2)      bunzip2 -v $1 ;;
      *.gz)       gunzip -v  $1 ;;
      *.rar)      unrar x    $1 ;;
      *.tar.bz2)  tar -xzfv  $1 ;;
      *.tar.gz)   tar -xzfv  $1 ;;
      *.tar.xz)   tar -xf    $1 ;;
      *.tar)      tar -xfv   $1 ;;
      *.tgz)      tar -xzfv  $1 ;;
      *.xz)       tar -xzf   $1 ;;
      *.zip)      unzip -v   $1 ;;
      *)
        echo -e "[!] '$FILE' cannot be extracted with extract()"
        echo -e "[!] Formats: 7z, bz2, gz, rar, tar.bz2, tar.gz, tar, tgz, zip, xz"
        ;;
    esac
  else
    echo "[Error]: Cannot extract '$FILE'"
  fi
}


# >> Create a tar.gz archive
# ___________________________________________________________________
function compress() {
  if [[ -z $1 ]]; then
    echo -e "[!] You must provide a filename or folder to archive."
    echo -e "compress <name>.tar.gz <folder|file>"
    return
  fi

  # Strip off the Extension
  FILENAME=${1%.*}
  tar -cvzf "$FILENAME.tar.gz" $1
}


# >> Find the largest files in current directory
# ___________________________________________________________________
function find_largest_files() {
  du -h -x -s -- * | sort -r -h | head -20;
}


# >> Show the latest file in current directory
# ___________________________________________________________________
latest_file() {
  local f latest
  for f in "${1:-.}"/*
    do
      [[ $f -nt $latest ]] && latest="$f"
    done
   printf '%s\n' "$latest"
}

# >> Show the oldest file in current directory
# ___________________________________________________________________
oldest_file () {
  local f oldest
  for file in "${1:-.}"/*
    do
      [[ -z $oldest || $f -ot $oldest ]] && oldest="$f"
    done
  printf '%s\n' "$oldest"
}


# >> Display my system info
# ___________________________________________________________________
function sysinfo() {
  clear
  printf "   %s\n" "IP ADDR: $(curl ifconfig.me)"
  printf "   %s\n" "USER: $(echo $USER)"
  printf "   %s\n" "DATE: $(date)"
  printf "   %s\n" "UPTIME: $(uptime -p)"
  printf "   %s\n" "HOSTNAME: $(hostname -f)"
  printf "   %s\n" "CPU: $(awk -F: '/model name/{print $2}' | head -1)"
  printf "   %s\n" "KERNEL: $(uname -rms)"
  printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
  printf "   %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1" "}')"
  printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
  printf "\n"
}
