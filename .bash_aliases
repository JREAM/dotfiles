#!/bin/bash
# ___________________________________________________________________
#
#
#                       Bashalias [Sourced from .bashrc]
#                        Speed up Commands in Terminal
#
# Suggested Apt Packages: pydf colordiff nmap
# Note: See .exports for Color ENV variables
#
# Table of Contents:
#   * CUSTOM CONFIG *
#   - COLORS
#   - COMMON
#   - COMMON W/INSTALLS
#   - NGINX
#   - APACHE2
#   - PYTHON
#   - GIT
#   - LEGIT FUNCTIONS
# ___________________________________________________________________

# ___________________________________________________________________
#
#                           * CONFIG *
# ___________________________________________________________________

PHPFPM_VERSION='7.2'

# Fix "GREP OPTIONS depcrated"
#GREP_OPTIONS="$GREP_OPTIONS -r -d skip"
export GREP_COLOR='1;32'


# Personal Folder shortcuts
[ -d ~/projects ] && alias p='cd ~/projects/'
[ -d ~/dev ] && alias d='cd ~/dev/' && alias dev='cd ~/dev'
[ -d ~/Downloads ] && alias dl="cd ~/Downloads"

# ___________________________________________________________________
#
#                           ACL
# ___________________________________________________________________
if hash setfacl 2>/dev/null; then

  setfacl-user() {
    if [ $# -ne 2 ]; then
      echo "[!] Error: Missing Argument for \$user and \$path"
      echo "[!] Example:  $ command user /any/path"
      return 1
    fi
    if ! id -u "$1" > /dev/null 2>&1; then
      echo "[!] Error: You provided a user $1 that does not exist"
      return 1
    fi
    if [ ! -d "$2" ] && [ ! -f "$2" ]; then
      echo "[!] Error: You provided a file or path $2 that does not exist"
      return 1
    fi

    setfacl -R -m u:$1:rwx $2
    setfacl -Rd -m u:$1:rwx $2
  }

  setfacl-group() {
    if [ $# -ne 2 ]; then
      echo "[!] Error: Missing Argument for \$user and \$path"
      echo "[!] Example:  $ command user /any/path"
      return 1
    fi
    if ! grep -q $1 /etc/group; then
      echo "[!] Error: You provided a group $1 that does not exist."
      return 0
    fi
    if [ ! -d "$2" ] && [ ! -f "$2" ]; then
      echo "[!] Error: You provided a file or path $2 that does not exist"
      return 0
    fi

    setfacl -R -m g:$1:rwx $2
    setfacl -Rd -m g:$1:rwx $2
  }

fi

# ___________________________________________________________________
#
#                           COMMON
# ___________________________________________________________________


#function memusage {
#  ps aux | awk '{print $4 "%\t" int($6/1024) " MB\t" $11}' | sort -n
#}

alias chgrp='sudo chown'
alias chmod='sudo chmod'
alias chmox='sudo chmod'  # always make this typo
alias chown='sudo chown'
alias service='sudo service'
alias systemctl='sudo systemctl'

alias c='clear'
alias h='history'
alias j='jobs -l'

# Use the Latest Python Version via "py"
alias py='python'
alias ports='netstat -tulanp'
alias time="date +'%A, %B %m %Y at%l:%M%P %Z'"
alias vi=vim


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

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias www='cd /var/www/'

# Super User (SUDO) Shortcuts
alias apt-get='sudo apt-get'
alias apt='sudo apt'
alias root='sudo -i'                # Become root
alias service='sudo service'
alias su='sudo -i'                  # Become root
alias sudo='sudo '                  # Enable aliases to be sudo-ed

# Reboot Bypass Wait
alias poweroff='sudo /sbin/poweroff'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'

alias autoclean='sudo apt autoclean'
alias autoremove='clean'
alias clean='sudo apt autoremove; sudo apt autoclean'
alias update='sudo apt-get update'
alias updatey='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt autoclean'
alias upgrade='sudo apt-get upgrade'

alias ppa='sudo apt-add-repository'

# Preserve / root folder permissions
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'

# Mount (Readable)
alias mount='mount | column -t'

# Ping
alias ping='ping -c 5'  # Send X packets
alias fastping='ping -c 100 -s.2'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Utility
alias mkdir='mkdir -pv'             # $ mkdir x/y/z
alias xclip='xclip -sel clip'       # Copy to Clipboard $ cat file.txt | xclip
alias wget="wget -c"                # Resume if failed by default
alias findfile="find . -name "      # Make find a little easier

# Disk Related
alias df='df -H | grep -v "/snap"'  # Remove the snap directories
alias du='du -ch'

# Utility: Get My IP
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myips="hostname -I"

# ___________________________________________________________________
#
#                       COMMON W/INSTALLS
# ___________________________________________________________________

# install: $ sudo apt install colordiff
if hash colordiff 2>/dev/null; then
  alias diff='colordiff'
fi

# install: $ sudo apt install nmap
if hash nmap 2>/dev/null; then
  alias portsopen='nmap localhost --open'
fi

# Figlet (CLI)
if hash lolcat 2>/dev/null; then
  alias figlet-fonts="showfigfonts | lolcat" || alias figlet-fonts="showfigfonts"
fi

# For Windows | Make Shortcut Run as Administrator!
if [ -f "/c/ProgramData/chocolatey/bin/choco" ]; then
    alias choco="/c/ProgramData/chocolatey/bin/choco"
fi

# ___________________________________________________________________
#
#                           NGINX
# ___________________________________________________________________

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

# ___________________________________________________________________
#
#                           APACHE2
# ___________________________________________________________________

alias a2ls-mods-en='ls /etc/apache2/mods-enabled'
alias a2ls-mods='ls /etc/apache2/mods-available'
alias a2ls-sites-en='ls /etc/apache2/sites-enabled'
alias a2ls-sites='ls /etc/apache2/sites-available'

alias a2graceful='sudo /usr/sbin/apachectl -k graceful'
alias a2log='sudo tail /var/log/apache2/error.log'
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

# ___________________________________________________________________
#
#                           PHP FPM
# ___________________________________________________________________

alias fpm-log="sudo tail /var/log/php$PHPFPM_VERSION-fpm.log"
alias fpm-reenable="systemctl restart php$PHPFPM_VERSION-fpm.service"
alias fpm-reload="systemctl reload php$PHPFPM_VERSION-fpm.service"
alias fpm-restart="systemctl restart php$PHPFPM_VERSION-fpm.service"
alias fpm-restart="systemctl restart php$PHPFPM_VERSION-fpm.service"
alias fpm="sudo php$PHPFPM_VERSION-fpm"

# ___________________________________________________________________
#
#                           GIT
# ___________________________________________________________________

# Prefer To type gitA<Tab> for quick update
alias gitAddPush="git add . && git cm 'Standard Update' && git push"
alias gitPush="git push"
alias gitPull="git pull"

# ___________________________________________________________________
#
#                        LEGIT FUNCTIONS
# ___________________________________________________________________

# Find in file
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

# Directory Loop (All Children/Sub-Folders)
#
#   @TODO [ON HOLD, SEE BELOW] PASS -d=2 or --depth=<number> to allow over 1 level deep
#
# examples: $ loopdircmd git checkout development
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

# Exty4yract Files with one function <@DS>
# ___________________________________________________________________

extract () {
  if [ -f "$1" ]; then
    FILE=$1
    case $FILE in
      *.7z)       z x       "$FILE";;
      *.bz2)      bunzip2 -v  "$FILE";;
      *.gz)       unzip -v  "$FILE";;
      *.rar)      unrar x   "$FILE";;
      *.tar.bz2)  tar -xzfv   "$FILE";;
      *.tar.gz)   tar -xzfv   "$FILE";;
      *.tar)      tar -xfv    "$FILE";;
      *.tgz)      tar -xzfv   "$FILE";;
      *.zip)      unzip -v "$FILE";;
      *)
        echo -e "[!] Error: '$FILE' cannot be extracted with extract()"
        echo -e "\t[!] Tried Formats: 7z, bz2, gz, rar, tar.bz2, tar.gz, tar, tgz, zip"
        ;;
    esac
  else
    echo "[Error]: Cannot extract '$FILE'"
  fi
}
# ___________________________________________________________________

# End of File
