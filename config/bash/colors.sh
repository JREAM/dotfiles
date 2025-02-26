#!/bin/sh
# shellcheck disable=SC1087

# ╔═════════════════════════════════════════════════════════════════╗
# ║  BASH VARIABLES                                                 ║
# ╠═════════════════════════════════════════════════════════════════╣
# ║ May be used in other scripts.                                   ║
# ║ Ensure this is sourced from ~/.bashrc                           ║
# ╚═════════════════════════════════════════════════════════════════╝

# Set TERM if not already set
[ -z "${TERM+x}" ] && export TERM='xterm-256color'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Colors and Formatting                                           │
# └─────────────────────────────────────────────────────────────────┘

ESC="\033"
RESET="$ESC[0m"
RESET_BOLD="$ESC[21m"
RESET_DIM="$ESC[22m"
RESET_UNDERLINE="$ESC[24m"
RESET_HIDDEN="$ESC[28"

BOLD="$ESC[1m"
DIM="$ESC[2m"
ITALIC="$ESC[3m"
UNDERLINE="$ESC[4m"
HIDDEN="$ESC[8m"

# Function to define color variables
define_colors() {
  local mode=$1
  local prefix=$2
  local colors=("BLACK" "RED" "GREEN" "YELLOW" "BLUE" "PURPLE" "CYAN" "WHITE")
  local start=${3:-30}

  for i in "${!colors[@]}"; do
    export "${prefix}${colors[$i]}=${ESC}[$mode;$((start + i))m"
  done
}

# Define color sets
define_colors 0 ""      # Standard
define_colors 1 "B"     # Bold
define_colors 4 "U"     # Underline
define_colors 0 "I" 90  # Intense
define_colors 1 "IB" 90 # Intense Bold


# ┌─────────────────────────────────────────────────────────────────┐
# │ Utility Functions                                               │
# └─────────────────────────────────────────────────────────────────┘

__deverror() {
  echo -e "${IBRED}(!)${RESET} Developer Error!";
}

message() {
  local color=$1 icon="${BOLD}$2${RESET_BOLD}" flag text

  # Check if the third parameter is a flag (-i), or it's part of the message
  if [ "$3" == "-i" ]; then
    flag="-i"
    text=$4
  else
    text=$3
  fi

  # If no text is provided, it's a developer error
  [ -z "$text" ] && __deverror && return

  # Check for the optional '-i' flag (color only symbol)
  if [ "$flag" == "-i" ]; then
    echo -e "${!color}${icon}${RESET} $text"
  else
    echo -e "${!color}${icon}${RESET} ${!color}$text${RESET}"
  fi
}
# ┌─────────────────────────────────────────────────────────────────┐
# │ For ouutputing colorized messages                               │
# └─────────────────────────────────────────────────────────────────┘
# [Use]   $ success "hello world"     Colorize Full String
#         $ info hello                Colorize Full String
#         $ warn -i "uh oh"           Colorize Icon only
success() { message "IGREEN"   "(+)" "$1" "$2"; }
info()    { message "IBLUE"    "(i)" "$1" "$2"; }
warn()    { message "IYELLOW"  "[-]" "$1" "$2"; }
danger()  { message "IRED"     "[!]" "$1" "$2"; }


# Function to list available colors
colors() {
  for ((i = 16; i < 256; i++)); do
    printf "\e[48;5;${i}m%03d" $i
    printf '\e[0m'
    [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
  done
}
alias list-colors='colors'

# ┌─────────────────────────────────────────────────────────────────┐
# │ Box Drawing Characters                                          │
# └─────────────────────────────────────────────────────────────────┘

# Single line
declare -A Ln=(
  [H]="─" [V]="│" [TL]="┌" [TR]="┐" [BL]="└" [BR]="┘"
  [MT]="┬" [MB]="┴" [ML]="├" [MR]="┤" [MC]="┼"
  [RdTL]="╭" [RdTR]="╮" [RdBR]="╯" [RdBL]="╰"
)

# Double line
declare -A Ln2x=(
  [H]="═" [V]="║" [TL]="╔" [TR]="╗" [BL]="╚" [BR]="╝"
  [MT]="╦" [MB]="╩" [ML]="╠" [MR]="╣" [MC]="╬"
)

# Fat line
declare -A LnF=(
  [H]="━" [V]="┃" [TL]="┏" [TR]="┓" [BL]="┗" [BR]="┛"
  [MT]="┳" [MB]="┻" [ML]="┣" [MR]="┫" [MC]="╋"
)

# Connectors and misc
declare -A LnMisc=(
  [1x2TL]="╒" [1x2TR]="╕" [1x2BL]="╘" [1x2BR]="╛" [1x2ML]="╞" [1x2MR]="╡" [1x2MT]="╥" [1x2MB]="╨" [1x2MC]="╪"
  [2x1TL]="╓" [2x1TR]="╖" [2x1BL]="╙" [2x1BR]="╜" [2x1ML]="╟" [2x1MR]="╢" [2x1MT]="╤" [2x1MB]="╧" [2x1MC]="╫"
  [DshH]="╌" [DshV]="┊" [DshFatH]="┅" [DshFatV]="┋"
)

# Export all variables

for array in Ln Ln2x LnF LnMisc; do
  declare -n arr=$array
  for key in "${!arr[@]}"; do
    export "${array}${key}=${arr[$key]}"
  done
done

# ┌─────────────────────────────────────────────────────────────────┐
# │ Colorized 'man' Pages                                           │
# └─────────────────────────────────────────────────────────────────┘
# [Notes]   Colors from .bash_vars could be used here.
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

