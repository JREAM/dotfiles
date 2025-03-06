#!/bin/sh
# shellcheck disable=SC1087,SC2034

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
  i=16
  while [ $i -lt 256 ]; do
    printf "\e[48;5;${i}m%03d" $i
    printf '\e[0m'
    [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
    i=$((i + 1))
  done
}
alias list-colors='colors'

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


# --- Helper Functions ---

# Function to find the closest 8-bit color code
# (This is the most crucial part for accuracy)
closest_color() {
  hex="$1"
  r=$((16#${hex:0:2}))  # Extract red component
  g=$((16#${hex:2:2}))  # Extract green component
  b=$((16#${hex:4:2}))  # Extract blue component

  # Calculate 8-bit color index (see explanation below)
  r5=$(( (r * 5 / 255) ))
  g5=$(( (g * 5 / 255) ))
  b5=$(( (b * 5 / 255) ))
  color_index=$(( 16 + 36*r5 + 6*g5 + b5 ))

  echo "$color_index"
}

# Function to set the foreground color
fg() {
  color_index=$(closest_color "$1")
  echo -en "\033[38;5;${color_index}m"
}

# Function to set the background color
bg() {
  color_index=$(closest_color "$1")
  echo -en "\033[48;5;${color_index}m"
}

# Function to reset color to default
reset_color() {
  echo -en "\033[0m"
}

# --- Color Definitions ---

# Original Colors
pink=$(closest_color "ff6188")
orange=$(closest_color "fc9867")
yellow=$(closest_color "ffd866")
green=$(closest_color "a9dc76")
blue=$(closest_color "78dce8")
purple=$(closest_color "ab9df2")


color_test() {
  echo "Color Table:"
  echo "+----------------+---------+---------+-------------+"
  echo "| Color Name     | Hex     | 8-bit   | Example     |"
  echo "+----------------+---------+---------+-------------+"
  printf "| Pink           | #ff6188 | %-7s | " "$pink";  fg ff6188; echo -n "Pink";   reset_color; echo " |" "$pink"
  printf "| Orange         | #fc9867 | %-7s | " "$orange";fg fc9867; echo -n "Orange"; reset_color; echo " |" "$orange"
  printf "| Yellow         | #ffd866 | %-7s | " "$yellow";fg ffd866; echo -n "Yellow"; reset_color; echo " |" "$yellow"
  printf "| Green          | #a9dc76 | %-7s | " "$green"; fg a9dc76; echo -n "Green";  reset_color; echo " |" "$green"
  printf "| Blue           | #78dce8 | %-7s | " "$blue";  fg 78dce8; echo -n "Blue";   reset_color; echo " |" "$blue"
  printf "| Purple         | #ab9df2 | %-7s | " "$purple";fg ab9df2; echo -n "Purple"; reset_color; echo " |" "$purple"
  echo "+----------------+---------+---------+-------------+"
}
