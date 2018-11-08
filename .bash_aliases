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
#   - COLORS
#   - COMMON
#   - COMMON W/INSTALLS
#   - NGINX
#   - APACHE2
#   - PYTHON
#   - GIT
#   - LEGIT FUNCTIONS
# ___________________________________________________________________

# Fix "GREP OPTIONS depcrated"
#GREP_OPTIONS="$GREP_OPTIONS -r -d skip"
export GREP_COLOR='1;32'


# Personal Folder shortcuts
[ -d ~/projects ] && alias p='cd ~/projects/'
[ -d ~/dev ] && alias d='cd ~/dev/' && alias dev='cd ~/dev'

# ___________________________________________________________________
#
#                           ACL
# ___________________________________________________________________
if type setfacl > /dev/null; then

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

if type cheat > /dev/null; then
  export CHEATCOLORS=true
  export CHEAT_EDITOR=vim
fi

# ___________________________________________________________________
#
#                           COLORS
# ___________________________________________________________________
if [[ ! -z DOTEXPORTS_SET_COLORS ]]; then
tput sgr0   # Reset Colors While Setting Variables
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    PURPLE=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)

    BOLD=$(tput bold)
    RESET=$(tput sgr0)
fi

# ___________________________________________________________________
#
#                           COMMON
# ___________________________________________________________________

alias chmox='sudo chmod'  # always make this typo
alias chmod='sudo chmod'
alias chown='sudo chown'
alias chgrp='sudo chown'
alias service='sudo service'
alias systemctl='sudo systemctl'

alias c='clear'
alias h='history'
alias j='jobs -l'

# Use the Latest Python Version via "py"
PYTHON_LATEST=$(ls -t /usr/bin/python* | head -1)
alias py=$PYTHON_LATEST

alias vi=vim
alias ports='netstat -tulanp'
alias time="date +'%A, %B %m %Y at%l:%M%P %Z'"


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
alias sudo='sudo '                  # Enable aliases to be sudo-ed
alias apt-get='sudo apt-get'
alias apt='sudo apt'
alias service='sudo service'
alias root='sudo -i'                # Become root
alias su='sudo -i'                  # Become root

# Reboot Bypass Wait
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias shutdown='sudo /sbin/shutdown'

alias upgrade='sudo apt-get upgrade'
alias update='sudo apt-get update'
alias updatey='sudo apt-get update && sudo apt-get upgrade -y'
alias autoremove='sudo apt autoremove'
alias autoclean='sudo apt autoclean'
alias ppa='sudo apt-add-repository'

# Preserve / root folder permissions
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Mount (Readable)
alias mount='mount |column -t'

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

if (( $+commands[colordiff] )) >/dev/null 2>&1; then
    # install: $ sudo apt install colordiff
    alias diff='colordiff'
fi

if (( $+commands[nmap] )) >/dev/null 2>&1; then
    # install: $ sudo apt install nmap
    alias portsopen='nmap localhost --open'
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
alias ngtest='sudo nginx -t'
alias ngreload='sudo service nginx reload'
alias ngrestart='sudo service nginx restart'
alias ngstart='sudo service nginx start'
alias ngstop='sudo service nginx stop'
alias ngpath='cd /etc/nginx/'

alias ngavailable='cd /etc/nginx/sites-available'
alias ngenabled='cd /etc/nginx/sites-enabled'

alias nglog='tail -n 50 /var/log/nginx/error.log'
alias ngaccess='tail -n 50 /var/log/nginx/access.log'

alias ngstatus='systemctl status nginx.service'

alias ngdisstartup='sudo service nginx stop && sudo update-rc.d nginx disable && echo "nginx set to NOT autostart"'
alias ngenstartup='sudo service nginx start && sudo update-rc.d nginx enable && echo "nginx set to autostart"'
# ___________________________________________________________________
#
#                           APACHE2
# ___________________________________________________________________

alias a2graceful='sudo /usr/sbin/apachectl -k graceful'
alias a2modules='sudo apachectl -t -D DUMP_MODULES'
alias a2vhosts='sudo apachectl -t -D DUMP_VHOSTS'
alias a2version='sudo apachectl -v'
alias a2test='sudo apachectl -t'
alias a2reload='sudo service apache2 reload'
alias a2restart='sudo service apache2 restart'
alias a2start='sudo service apache2 start'
alias a2stop='sudo service apache2 stop'
alias a2path='cd /etc/apache2/'
alias a2status='systemctl status apache2.service'
alias a2log='sudo tail /var/log/apache2/error.log'

alias a2disconf='sudo a2disconf'
alias a2enconf='sudo a2enconf'
alias a2dismod='sudo a2dismod'
alias a2enmod='sudo a2enmod'
alias a2dissite='sudo a2dissite'
alias a2ensite='sudo a2ensite'
alias a2graceful='sudo a2graceful'
alias a2modules='sudo a2modules'

alias a2sa='cd /etc/apache2/sites-available'
alias a2se='cd /etc/apache2/sites-enabled'

alias a2log='tail -n 50 /var/log/apache2/error.log'
alias a2access='tail -n 50 /var/log/apache2/access.log'

alias a2ctl='sudo apachectl'
alias apachectl='sudo apachectl'
alias apache2ctl='sudo apache2ctl'
# ___________________________________________________________________
#
#                           PYTHON
#
#            Virtualenvwrapper: Globally or Pyenv installation
# ___________________________________________________________________

if [ -d ~/.virtualenvs ]; then
  export WORKON_HOME=~/.virtualenvs
  export PROJECT_HOME=~/projects
  export PIP_VIRTUALENV_BASE=~/.virtualenvs

  USING_PYENV=false
  FIND_VENVWRAP="/usr/local/bin/virtualenvwrapper.sh"

  # Determine if pyenv is used.
  if [[ $(which python) == *".pyenv"* ]]; then
    USING_PYENV=true;
    VERSION=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
    FIND_VENVWRAP=~/.pyenv/versions/$VERSION/bin/virtualenvwrapper.sh
  fi
  #./.pyenv/versions/3.6.5/lib/python3.6/site-packages

  if [[ -f "$FIND_VENVWRAP" ]]; then
    source $FIND_VENVWRAP
    eval "$(pyenv init -)"
  fi

  alias mkvirtualenv="mkvirtualenv --no-site-packages --distribute"

  if [ -d ~/.pyenv/plugins/pyenv-virtualenvwrapper ]; then
    # Allow PyEnv Virtualenvwrapper to create venvs
    # Auto activate virtualenvs on directory change
    eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  fi
fi

export PYTHONDONTWRITEBYTECODE=1  # Stop Python from generating bytecode files

# ___________________________________________________________________
#
#                          RBEnv
# ___________________________________________________________________
if [ -f ~/.rbenv ]; then
  eval "$(rbenv init -)"
fi

# ___________________________________________________________________
#
#                           GIT
# ___________________________________________________________________

# Shrink Git Repo with Tool
# @src: https://rtyley.github.io/bfg-repo-cleaner/
function gitshrink() {
  if [[ -f "$HOME/apps/bfg-gitshrink.jar" ]]; then
    REMOTE=$(git config --get remote.origin.url)
    echo $REMOTE
    [ -z $REMOTE ] && echo "Not a git repository" && return false;

    SIZE_ORIG=$(git count-objects -vH | grep size-pack.*)

    echo "Backing up $REMOTE as a Cloned Mirror before proceeding"
    git clone --mirror $REMOTE

    echo "Running bfg utility for blobs larger than 50MB..."
    java -jar "$HOME/apps/bfg-gitshrink.jar" --strip-blobs-bigger-than 50M .

    echo "Expiring and Pruning Git Cache"
    git reflog expire --expire=now --all && git gc --prune=now --aggressive

    SIZE_AFTER=$(git count-objects -vH | grep size-pack.*)

    echo -e "[ Finished ] - Stats:"
    echo -e "Original Repository Size:\t $SIZE_ORIG"
    echo -e "Modified Repository Size:\t $SIZE_AFTER\n"
  else
    echo -e "Oops! You don't have the bfg utility; download it from:\n"
    echo -e "1: https://rtyley.github.io/bfg-repo-cleaner/ (the .jar file)"
    echo -e "2: Place it in $HOME/apps/bfg-gitshrink.jar"
    echo -e "3: *You will need Java 8 installed"
    echo -e "\t$ mkdir ~/apps &&  mv bfg*.jar ~/apps/bfg-gitshrink.jar"
    echo -e "\t$ source ~/.bash_aliases"
  fi
}

# ___________________________________________________________________
#
#                        LEGIT FUNCTIONS
# ___________________________________________________________________

# Find in file
#
# examples:  $ findinfile 'hello mom' .
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

# Directory Loop (All Children/Sub-Folders)
#
#   @TODO [ON HOLD, SEE BELOW] PASS -d=2 or --depth=<number> to allow over 1 level deep
#
# examples: $ loopdircmd git checkout development
# ___________________________________________________________________
loopdir() {
    if [ -z "$1" ]; then
        echo -e "[!] Whoops! Provide a command,\n\t eg: loopdircmd git checkout development\n"
        return
    fi

    # $* joins all arguments as a string
    echo "$*"

    # Go One Level Deep
    # @TODO Using this right now for CWD OUTPUT
    for d in ./*/; do
        echo -e "\n${BOLD}${WHITE}${d}${RESET}"
        (cd "$d" && $*);
    done

    # @TODO: This works great, but I'd like to print out the directory im in better
    # -name . skips running from the CWD
    # find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && echo -e \"\n${BOLD}${GREEN}In Directory: ${PWD}${RESET}\" && $*" \;
}

# Calculator
#   Simple calculator, cannot use spaces (MIGHT FIX)
#
# examples:     $  calc 5*500
# ___________________________________________________________________
calc() {
  if (( $+commands[bc] )); then
    echo "scale=3; $*" | bc -l
  else
    awk "BEGIN { print $* }"
  fi
}

# End of File
