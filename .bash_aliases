################################################
####################  NGINX  ###################
################################################
function ngmake { sudo vim /etc/nginx/sites-available/$1; }
function ngenable { sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled; }
function ngdisable { sudo rm /etc/nginx/sites-enabled/$1; }
alias ngtest='sudo service nginx configtest'
alias ngreload='sudo service nginx reload'
alias ngrestart='sudo service nginx restart'
alias ngstart='sudo service nginx start'
alias ngstop='sudo service nginx stop'
alias ngpath='cd /etc/nginx/'


################################################
###################  APACHE  ###################
################################################
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

alias a2disconf='sudo a2disconf'
alias a2enconf='sudo a2enconf'
alias a2dismod='sudo a2dismod'
alias a2enmod='sudo a2enmod'
alias a2dissite='sudo a2dissite'
alias a2ensite='sudo a2ensite'
alias a2graceful='sudo a2graceful'
alias a2modules='sudo a2modules'

alias a2log='cat /var/log/apache2/error.log'
alias a2access='cat /var/log/apache2/access.log'

alias apachectl='sudo apachectl'
alias apache2ctl='sudo apache2ctl'

################################################
#################### DOCKER ####################
################################################

alias dk='docker'
alias drm="docker rm"
alias dps="docker ps"
function newbox () {
    docker run --name $1 --volumes-from=volume_container -it -v /var/run/docker.sock:/var/run/docker.sock -e BOX_NAME=$1 jream/devbox
}

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

# Apply Sudo when you forget for service
# -----------------------------------------------
alias service='sudo service'


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

# diff in colors (apt install colordiff)
# -----------------------------------------------
alias diff='colordiff'

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

# Clone all Github User Repos (Limit 100 repos)
# Defaults to a user Repository, pass --o or --org for Organization.
# Example: cloneall jesse123  (Clones user/jesse and private repos if you own)
# Example: cloneall privateteam -o (Clones org/privateteam and all public repos)
# ------------------------------------------------
function gitcloneall() {
    CLONE_FROM='users' # Default
    if [ -z "$1" ]; then
        "Provide a name or organization, cannot be empty"
        return
    fi
    if [ -z "${GITHUB_ACCESS_TOKEN}" ]; then
        "Please set GITHUB_ACCESS_TOKEN='yourtoken' in .bashrc so you can bulk clone private users and orgs you belong to"
    fi

    access_token=$GITHUB_ACCESS_TOKEN
    REPO_URL= "https://api.github.com/users/$1/repos?page=1&per_page=100"
    curl "https://api.github.com/users/$1/repos?page=1&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
}

# Make find a little easier
# -----------------------------------------------
alias findfile="find . -name "

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

# Set ACL Permissions to avoid 0777 dumbness
# -----------------------------------------------
function setfaclwww() {
  if [ -z "$1" ]; then
  #display usage if no parameters are given
    echo "Usage: setfacl2 <path> username (Defaults to \$USER)"
    return
  fi

  # Ensure user is in www-data
  sudo usermod -aG www-data $USER

  # Ensure user is in www-group
  sudo chown -R www-data:www-data $1
  # User ACL
  sudo setfacl -R -m u:$USER:rwx $1
  sudo setfacl -Rd -m u:$USER:rwx $1
  # Group ACL
  sudo setfacl -R -m g:www-data:rwx $1
  sudo setfacl -Rd -m g:www-data:rwx $1
}

# Apply sudo if forgotten
# -----------------------------------------------
alias apt-get="sudo apt-get"
alias apt="sudo apt"

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

# Python shorthand
# -----------------------------------------------
alias py='python'

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
alias updatey='sudo apt-get update && sudo apt-get upgrade -y'


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


# The compression to rule them all: compress <file.tar.gz> <./path>
# -----------------------------------------------
compress() {
  if [[ -n "$1" ]]; then
    FILE=$1
    case $FILE in
      *.tar ) shift && tar cf $FILE $* ;;
      *.tar.bz2 ) shift && tar cjf $FILE $* ;;
      *.tar.gz ) shift && tar czf $FILE $* ;;
      *.tgz ) shift && tar czf $FILE $* ;;
      *.zip ) shift && zip $FILE $* ;;
      *.rar ) shift && rar $FILE $* ;;
    esac
  else
    echo "Usage: compress <foo.tar.gz> ./foo ./bar"
  fi
}



# Moves up n Directorys, eg: $ up 4
# -----------------------------------------------
up() {
  local d=""
  limit=$1
  for ((i=1; i <= limit; i++)); do
    d=$d/..
  done

  d=$(echo $d | sed 's/^\///')

  if [[ -z "$d" ]]; then
    d=..
  fi

  cd $d
}



# Calculater, eg: calc 5 * 500 (No Spaces)
# -----------------------------------------------
calc() {
  if which bc &>/dev/null; then
    echo "scale=3; $*" | bc -l
  else
    awk "BEGIN { print $* }"
  fi
}

# Facl Setters, not recursive to prevent overriding
# File or Directory Executable permissions
# --------------------------------------------------
function aclfile() {
    return "This function is not ready"
    echo "(+) Set ACL for $USER:www-data rw [Files Only, Persist]"

    # Files cannot have defaults -d permissions
    while IFS= read -r -d $'\0' file; do
        echo "  Setting $file"
        # Default Mode: RW
        mode="rw"

        # If Executable, Add RWX
        if [[ -x "$file" ]]; then
            mode="rwx"
        fi
        sudo setfacl  -m u:$USER:$mode $file
        sudo setfacl  -m g:www-data:$mode $file
    done < <(find $CREATE -type f -print0)
    echo "(+) Done with Files"
}

function acldir() {
  return "This function is not ready"

  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: acldir|acldirs <path> <user (default: $USER)> <group (default: www-data)>"
  else
      use_user=$USER
      if [ -z "$2" ]; then
        use_user=$2
      fi

      use_group="www-data"
      if [ -z "$3" ]; then
        use_group=$3
      fi

      echo "This will set ACL as follows to Directories ONLY (-d Persists new Files):"
      echo "  sudo setfacl  -m u:$use_user:rwx $1"
      echo "  sudo setfacl -dm u:$use_user:rwx $1"
      echo "  sudo setfacl  -m g:$use_group:rwx $1"
      echo "  sudo setfacl -dm g:$use_group:rwx $1"
      echo "(?) Does this look correcte? The size of your directory can make it take a while. Contiue [y/N]: "
      read yn

      if [[ $yn =~ ^[Yy]$ ]]; then

        echo "(+) Set ACL for $use_user:www-data rwx [Directories Only, Persist]"
          while IFS= read -r -d $'\0' dir; do
            echo "  Setting $dir"
            sudo setfacl    -m u:$use_user:rwx $dir
            sudo setfacl -d -m u:$use_user:rwx $dir
            sudo setfacl    -m g:$use_group:rwx $dir
            sudo setfacl -d -m g:$use_group:rwx $dir
          done < <(find $1 -type d -print0)
        echo "(+) Done with Directories"
      else
        echo "(!) Operation Cancelled."
      fi
  fi
}

# Plural Versions
alias aclfiles=aclfile
alias acldirs=acldir
