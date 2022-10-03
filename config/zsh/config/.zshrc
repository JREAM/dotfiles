# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jesse"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  #git-lfs
  z
  colorize
  copyfile
  copybuffer
  cp
  docker
  #docker-compose
  extract
  colored-man-pages
  fzf
  #history
  #web-search
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# For plugin: colored-man-pages
less_termcap[md]="${fg_bold[yellow]}"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ╔═════════════════════════════════════════════════════════════════╗
# ║ Personal Folders                                                ║
# ╚═════════════════════════════════════════════════════════════════╝
[ -d ~/Downloads ] && alias dl='cd ~/Downloads'
# These are now on NFS share
[ -d /server ] && alias s='cd /server/'
[ -d /server/projects ] && alias p='cd /server/projects/'
[ -d /server/dev ] && alias d='cd /server/dev/' && alias dev='cd ~/server/dev'
[ -d /server/work ] && alias w='cd /server/work'

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Try to use GRC Colorizer                                        ║
# ╚═════════════════════════════════════════════════════════════════╝
COLORIZE="" # Empty by default, used in variables
if [ -x "$(command -v grc)" ] &>/dev/null; then
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
alias la="ls -lah --color=auto" # Long List
alias ll="ls -lah --color=auto" # Long List
alias ls="ls --color=auto"
alias l.="ls -d .* --color=auto | column -s='\n'" # List Hidden files
alias lh="l."                                     # <List Hidden Files>; Alias for Alias
alias ll.="ls -lhd .* --color=auto"               # Long List Hiddent
alias llh="ll."                                   # <List Hiddent Files; Alias for Alias
alias os="lsb_release -a"                         # Get OS Version

# Utility
alias mkdir='mkdir -pv'        # $ mkdir x/y/z
alias wget="wget -c"           # Resume if failed by default
alias findfile="find . -name " # Make find a little easier
alias xclip='xclip -sel clip'  # Copy to Clipboard $ cat file.txt | xclip

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Super User 'sudo' shortcuts
alias apt-get='sudo apt-get'
alias apt='sudo apt'
alias root='sudo -i' # Become root
alias service='sudo service'
alias su='sudo -i' # Become root
alias sudo='sudo ' # Enable aliases to be sudo-ed

# Sudo Permissions
alias chgrp='sudo chgrp --preserve-root'
alias chmod='sudo chmod --preserve-root'
alias chmox='sudo chmod --preserve-root' # always make this typo
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
alias ping='ping -c 5' # Send X packets

# Disk Related
alias df='df -H | grep -v "/snap"' # Remove the snap directories
alias du='du -ch'

# SSH Related
alias ssh-fingerprint='ssh-keygen -lf $1'
alias ssh-permissions="chown -R $USER:$USER ~/.ssh && \
  chmod 700 ~/.ssh && \
  chmod 600 ~/.ssh/* && \
  chmod 644 ~/.ssh/{*.pub,config,known_hosts}"

# Utility
alias permissions-octal="stat -c \"%a %n\" -- $1"

# Network
alias filesystem-reload='sudo systemctl start remote-fs.target local-fs.target && sudo systemctl daemon-reload' # FStab, mount -a doesn't work
alias fsreload="filesystem-reload"

# Reload Bashrc
alias bashreload="source $HOME/.bashrc"

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
if [ -x "$(command -v vtop)" ] &>/dev/null; then
  alias top="vtop" # npm i -g vtop
fi

function phpversion() {
  echo "[!] This updates PHP CLI only, not your webserver."
  sudo update-alternatives --config php
}

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

if commmand -v hstr &> /dev/null; then
  alias hh='hstr'
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║ NGINX                                                           ║
# ╚═════════════════════════════════════════════════════════════════╝
function ngensite { sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled; }
function ngdissite { sudo rm /etc/nginx/sites-enabled/$1; }
alias ngacclog='tail -f /var/log/nginx/access.log'
alias ngdisstartup='sudo service nginx stop && sudo update-rc.d nginx disable && echo "nginx set to NOT autostart"'
alias ngenstartup='sudo service nginx start && sudo update-rc.d nginx enable && echo "nginx set to autostart"'
alias ngerrlog='tail -f /var/log/nginx/error.log'
alias ngsitesen='ls /etc/nginx/sites-enabled'
alias ngsites='ls /etc/nginx/sites-available'
alias ngpath='cd /etc/nginx/'
alias ngreload='sudo service nginx reload'
alias ngrestart='sudo service nginx restart'
alias ngdir='cd /etc/nginx/sites-available'
alias ngstart='sudo service nginx start'
alias ngstatus='sudo service nginx status'
alias ngstop='sudo service nginx stop'
alias ngtest='sudo nginx -t'

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Apache2                                                         ║
# ╚═════════════════════════════════════════════════════════════════╝
alias a2modsen='ls /etc/apache2/mods-enabled'
alias a2mods='ls /etc/apache2/mods-available'
alias a2sitesen='ls /etc/apache2/sites-enabled'
alias a2sites='ls /etc/apache2/sites-available'

alias a2graceful='sudo /usr/sbin/apachectl -k graceful'
alias a2modlist='sudo apachectl -t -D DUMP_MODULES'
alias a2dir='cd /etc/apache2/'
alias a2reload='sudo service apache2 reload'
alias a2restart='sudo service apache2 restart'
alias a2start='sudo service apache2 start'
alias a2status='sudo service apache2 status'
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

alias a2acclog='tail -n 50 /var/log/apache2/access.log'
alias a2errlog='tail -n 50 /var/log/apache2/error.log'

alias mysqlvars="mysql -NBe 'SHOW VARIABLES'| sed 's,\t,^=,' | column -ts^"

# ╔═════════════════════════════════════════════════════════════════╗
# ║ PHP FPM                                                         ║
# ╚═════════════════════════════════════════════════════════════════╝
export PHP_FPM_VERSION=8.1
if [ -x "$(command -v php-fpm$PHP_FPM_VERSION)" ] &>/dev/null; then
  alias phpfpm-dir="cd /etc/php/$PHP_FPM_VERSION/"
  alias phpfpm-log="sudo tail -f /var/log/php$PHP_FPM_VERSION-fpm.log"
  alias phpfpm-stop="sudo service php-fpm$PHP_FPM_VERSION stop"
  alias phpfpm-reload="sudo service php-fpm$PHP_FPM_VERSION start"
  alias phpfpm-restart="sudo service php-fpm$PHP_FPM_VERSION restart"
  alias phpfpm-status="sudo service php-fpm$PHP_FPM_VERSION status"
fi

# ╔═════════════════════════════════════════════════════════════════╗
# ║ Git                                                             ║
# ╚═════════════════════════════════════════════════════════════════╝
# ...


# Vendor

# ╔═════════════════════════════════════════════════════════════════╗
# ║ PHP Composer                                                    ║
# ╚═════════════════════════════════════════════════════════════════╝
export COMPOSER_HOME=$HOME/.composer
if [ -d $COMPOSER_HOME ]; then
  PATH=$PATH:$COMPOSER_HOME
  export COMPOSER_HOME=$(composer config -g home)
fi

if [ -f "$HOME/.composer-autocomplete" ] ; then
    . $HOME/.composer-autocomplete
fi

if [ -d "$HOME/.phpenv/bin" ]; then
  PATH="$HOME/.phpenv/bin:$PATH"
  # Enable Shims and Autocomplete
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi


if command -v batcat &> /dev/null; then
  alias cat='batcat --paging=never'
fi


# ╔═════════════════════════════════════════════════════════════════╗
# ║  NVM (Node Version Manager)                                     ║
# ╚═════════════════════════════════════════════════════════════════╝
if [ -d $HOME/.nvm ]; then
  export NVM_DIR=$HOME/.nvm

  # Load NVM (Node Version Manager) and NVM Bash Completion
  [ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh
  [ -s $NVM_DIR/bash_completion ] && source $NVM_DIR/bash_completion

  # Check for an .nvmrc file if a specific version is in a folder.
  load-nvmrc() {
    if [ -f $HOME/.nvmrc -a -r $HOME/.nvmrc ]; then
      nvm use
    elif [ $(nvm version) != $(nvm version default) ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  cd() {
    builtin cd "$@"
    'load-nvmrc'
  }
fi


# ╔═════════════════════════════════════════════════════════════════╗
# ║  GRC (Bash Color Highlights)                                    ║
# ╚═════════════════════════════════════════════════════════════════╝
export GRC_ALIASES=true
if [ -f "/etc/profile.d/grc.sh" ]; then
  source /etc/profile.d/grc.sh
fi


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
