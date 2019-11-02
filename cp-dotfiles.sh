#!/bin/bash

# Get the directory regardless of where its called
ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Get Array ( ) of the LS Grep
DOTFILES=( $(ls -a $ROOTDIR | egrep "^\.[a-zA-Z]") )

# Simple Colors
NOCOLOR='\033[0m'
YLW='\033[01;33m'

# Empty Array to separate files/folders
FILES=()
DIRS=()

for item in "${DOTFILES[@]}"; do
  [[ -f "./${item}" ]] && FILES+=($ROOTDIR/$item) && continue
  # Ignore the .git folder, that'll be bad!
  [[ -d "./${item}" && "${item}" != ".git" ]] && DIRS+=($ROOTDIR/$item)
done

copyfiles() {
  echo -e "Copying Files.."
  for file in "${FILES[@]}"; do
    echo "[+] Copy: ${file} to ${HOME}"
    cp $file $HOME
  done
}

copydirs() {
  echo -e "Copying Directories.."
  for dir in "${DIRS[@]}"; do
      echo "[+] Copy: ${dir} to ${HOME}"
      cp -r $dir $HOME
  done
}

# Entry
echo -e "\n ${YLW}-------------------------------------------${NOCOLOR}"
echo -e "         ${YLW}Copy Dotfiles to Home Folder${NOCOLOR}"
echo -e " ${YLW}-------------------------------------------${NOCOLOR}"

# 8 column max array
echo -e "${YLW}[ Files ]${NOCOLOR}"
for f in "${FILES[@]}"; do
  printf "%-8s\n" "${f}"
done | column

echo -e "\n${YLW}[ Directories ]${NOCOLOR}"
for d in "${DIRS[@]}"; do
  printf "%-8s\n" "${d}"
done | column
echo -e "\n ${YLW}------------------------------------------- ${NOCOLOR}\n"

# User Prompt
echo -e "(1/2) Copy the above ${YLW}FILES${NOCOLOR} to ${HOME} folder ${YLW}[y/N]${NOCOLOR}?:"
read -p "(1/2) Copy to $HOME?: " ynFiles
echo -e "(2/2) Copy the above ${YLW}DIRECTORIES${NOCOLOR} to ${HOME} folder ${YLW}[y/N]${NOCOLOR}?"
read -p "(2/2) Copy to $HOME?: " ynDirs

# Flag for output at the end
DID_RUN=0

echo "Ignore Private Files, Safety Precaution"
if [ ! -f $HOME/.gitconfig_private ]; then
  touch .gitconfig_private
fi

if [ ! -f $HOME/.gitignore ]; then
  echo ".gitconfig_private" > $HOME/.gitignore
  echo ".exports_private" >> $HOME/.gitignore
fi

# Copy Files
if [[ $ynFiles =~ ^([yY])+$ ]]; then
  copyfiles
  DID_RUN=1
fi

# Copy Dirs
if [[ $ynDirs =~ ^([yY])+$ ]]; then
  copydirs
  DID_RUN=1;
fi

# Final Result
if [[ $DID_RUN == 1 ]]; then
  echo -e "\n[+] Finished, make sure to run:"
  echo -e "      $ source ~/.bashrc"
  exit 1
fi

echo -e "\nExiting...\n"
exit 1
