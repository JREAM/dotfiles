################################################
####################  NGINX  ###################
################################################
function ngmake { sudo vim /etc/nginx/sites-available/$1; }
function ngenable { sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled; }
function ngdisable { sudo rm /etc/nginx/sites-enabled/$1; }
alias ngreload='sudo service nginx reload'
alias ngtest='sudo service nginx configtest'


################################################
###################  APACHE  ###################
################################################
alias a2graceful='sudo /usr/sbin/apachectl -k graceful'
alias a2modules='sudo apachectl -t -D DUMP_MODULES'
alias a2vhosts='sudo apachectl -t -D DUMP_VHOSTS'
alias a2version='sudo apachectl -v'
alias a2test='sudo apachectl -t'


################################################
#################### PYTHON ####################
################################################

if [ -d "$HOME/.virtualenvs" ] ; then
    # Virtualenv stuff
    export WORKON_HOME=~/.virtualenvs
    export PROJECT_HOME=~/projects
    export PIP_VIRTUALENV_BASE=~/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh

    alias mkvirtualenv="mkvirtualenv --no-site-packages --distribute"
fi

# Stop Python from generating bytecode files
export PYTHONDONTWRITEBYTECODE=1

################################################
###################  COMMON  ###################
################################################
colorflag="--color"

# Listing and colors
# -----------------------------------------------
alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"

# Always use color output for `ls`
# -----------------------------------------------
alias ls="command ls ${colorflag}"

# Color Grep Commands
# -----------------------------------------------
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# IMPORTANT! If you get a bunch out output decalres
# Make sure this is all on the same line!
# -----------------------------------------------
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

# Easier navigation
# -----------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

if [ -d ~/projects ]; then
  alias p="cd ~/projects/"
fi

alias www="cd /var/www/"

# Shortcuts to become root user
# -----------------------------------------------
alias root='sudo -i'
alias su='sudo -i'

# Preserve / root folder permissions
# -----------------------------------------------
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Get OS Version
# -----------------------------------------------
alias os="lsb_release -a"

# Get Time
# -----------------------------------------------
est="date +'%A, %B %m %Y at%l:%M%P %Z'"
alias now="${est}"

# Utilities
# -----------------------------------------------
alias xclip="xclip -sel clip"

# Friendly disk usage alternative (must install)
# -----------------------------------------------
alias du="ncdu"

# Better looking output for df (must install)
# -----------------------------------------------
alias df="pydf"

# Resume wget by default if download fails
# -----------------------------------------------
alias wget="wget -c"

# IP address
# -----------------------------------------------
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
#alias myip="curl http://ipecho.net/plain; echo"

# Enable aliases to be sudoed
# -----------------------------------------------
alias sudo="sudo "

# Fetch all remote git branches to local in working directory
# -----------------------------------------------
alias gitall='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'

# Make find a little easier
# -----------------------------------------------
alias ffile="find . -name "

# Find in file
# -----------------------------------------------
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

  grep -Elir "(${1}) ${serach_path}"
}

# Apply sudo if forgotten
# -----------------------------------------------
alias apt-get="sudo apt-get"

# Mkdir more than one level if needed (Vebose).
# -----------------------------------------------
alias mkdir='mkdir -pv'

# History
# -----------------------------------------------
alias h='history'

# Clear Terminal
# -----------------------------------------------
alias c='clear'

# Jobs
# -----------------------------------------------
alias j='jobs -l'

# Always use VIM
# -----------------------------------------------
alias vi=vim

# See UDP/TCP Open Ports
# -----------------------------------------------
alias ports='netstat -tulanp'

# Shortcut to update
# -----------------------------------------------
alias update='sudo apt-get update'

# Shortcut to upgrade
# -----------------------------------------------
alias updatey='sudo apt-get update && sudo apt-get upgrade'


# The extraction to rule them all: extract file.ext
# -----------------------------------------------
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

