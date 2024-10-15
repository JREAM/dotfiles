#!/bin/bash

# Get the directory regardless of where its called
ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Get Array ( ) of the LS Grep
DOTFILES=( $(ls -a $ROOTDIR | egrep "^\.[a-zA-Z]") )

# Simple Colors
NOCOLOR='\033[0m'
YELLOW='\033[01;33m'

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

  # Copy the config files into ~/.config $XDG_CONFIG_HOME
  cp -R config/* ~/.config
  cp -R local/* ~/.local
  echo "[+] Copy: config/* to ~/.config/"
  echo "[+] Copy: local/* to ~/.local/"
}

for d in "${DIRS[@]}"; do
  printf "%-8s\n" "${d}"
done | printf "%-8s\n" "config" | column
# Entry
echo -e "\n ${YELLOW}-------------------------------------------${NOCOLOR}"
echo -e "         ${YELLOW}Copy Dotfiles to Home Folder${NOCOLOR}"
echo -e " ${YELLOW}-------------------------------------------${NOCOLOR}"

# 8 column max array
echo -e "${YELLOW}[ Files ]${NOCOLOR}"
for f in "${FILES[@]}"; do
  printf "%-8s\n" "${f}"
done | column

echo -e "\n${YELLOW}[ Directories ]${NOCOLOR}"
for d in "${DIRS[@]}"; do
  printf "%-8s\n" "${d}"
done | column
echo "Also: config/ will populate ~/.config/"
echo -e "\n ${YELLOW}------------------------------------------- ${NOCOLOR}\n"

# User Prompt
echo -e "(1/2) Copy the above ${YELLOW}FILES${NOCOLOR} to ${HOME} folder ${YELLOW}[y/N]${NOCOLOR}?:"
read -p "(1/2) Copy to $HOME?: " ynFiles
echo -e "(2/2) Copy the above ${YELLOW}DIRECTORIES${NOCOLOR} to ${HOME} folder ${YELLOW}[y/N]${NOCOLOR}?"
read -p "(2/2) Copy to $HOME?: " ynDirs

# Flag for output at the end
DID_RUN=0

# Copy Files
if [[ $ynFiles =~ ^([yY])+$ ]]; then
  copyfiles
  DID_RUN=1
fi

# Copy Dirs
if [[ $ynDirs =~ ^([yY])+$ ]]; then
  copydirs
  DID_RUN=1;

  # Vundle
  if [ -d ~/.config/vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  fi
fi

# Final Result
if [[ $DID_RUN == 1 ]]; then
  echo -e "\n[+] Finished, make sure to run:"
  echo -e "      $ source ~/.bashrc"
  exit 1
fi


echo -e "\nExiting...\n"
exit 1
