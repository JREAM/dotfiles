#!/bin/bash

# Get the directory regardless of where its called
ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Get Array ( ) of the LS Grep
DOTFILES=( $(ls -a $ROOTDIR | egrep "^\.[a-zA-Z]") )

# Empty Array to separate files/folders
FILES=()
DIRS=()

for item in "${DOTFILES[@]}"; do
  [[ -f "./${item}" ]] && FILES+=($ROOTDIR/$item) && continue
  # Ignore the .git folder, that'll be bad!
  [[ -d "./${item}" && "${item}" != ".git" ]] && DIRS+=($ROOTDIR/$item)
done

# // Debugging //
#echo "FILES"
#for a in "${FILES[@]}"; do
#  echo $a;
#done

#echo "DIRS"
#for a in "${DIRS[@]}"; do
#  echo $a;
#done

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

completed() {
  echo -e "\n[+] Finished, make sure to run:"
  echo -e "      $ source ~/.bashrc"
}

# Entry
echo -e "\n -------------------------------------------"
echo -e "         Copy Dotfiles to Home Folder"
echo -e " -------------------------------------------"

# 8 column max array
echo "[ Files ]"
for f in "${FILES[@]}"; do
  printf "%-8s\n" "${f}"
done | column

echo -e "\n[ Directories ]"
for d in "${DIRS[@]}"; do
  printf "%-8s\n" "${d}"
done | column
echo -e "\n ------------------------------------------- \n"

# User Prompt
read -p "(1/2) Copy the above FILES to ${HOME} folder [y/N]?: " ynFiles
read -p "(2/2) Copy the above DIRECTORIES to ${HOME} folder [y/N]?: " ynDirs

# Flag for output at the end
DID_RUN=0

echo "Ignore Private Files, Safety Precaution"
if [ ! -f "$HOME/.gitconfig_private" ] && touch .gitconfig_private
if [ ! -f "$HOME/.gitignore" ]; then
  echo ".gitconfig_private" > $HOME/.gitignore
  echo ".exports_private" >> $HOME/.gitignore
fi

# Copy Files
[[ $ynFiles =~ ^([yY])+$ ]] && copyfiles && DID_RUN=1

# Copy Dirs
[[ $ynDirs =~ ^([yY])+$ ]] && copydirs && DID_RUN=1

# Final Result
[[ $DID_RUN == 1 ]] && completed || echo "Exiting..."

