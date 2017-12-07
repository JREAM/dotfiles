#!/bin/bash

F=(
  nvm-update.sh
  .bash_aliases
  .bashrc
  .bash_vars
  .bash_vendors
  .bash_completion_ng
  .dockerrc
  .exports
  .gemrc
  .gh_complete
  .curlrc
  .pylintrc
  .virtualenvs
  .zshrc
  .jscsrc
  .jslintrc.json
  .tmux.conf
  tslint.json
  .editorconfig
  .grc
  # Do NOT copy .git
  .phpcs.xml
  .profile
  .scss-lint.yml
  .eslintrc.json
  .wgetrc
)


completed() {
  echo "Finished, run: $ source ~/.bashrc"
  echo "[+] If you want to install and use ZSH over Bash, Run this command:"
  echo ""
  echo 'sudo apt install zsh && sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'
  echo ""
}

copyfiles() {
  echo -e "Copying to ${HOME}...\n"
  for file in "${F[@]}"; do
    cp -r $file $HOME
  done
}


# Entry
echo -e "\n -------------------------------------------"
echo -e "\n       Copy Dotfiles to Home Folder\n"
echo -e ""
echo -e "\n     ++ The files below will be copied ++"
echo -e "\n -------------------------------------------"

# 8 column max array
for f in "${F[@]}"; do
  printf "%-8s\n" "${f}"
done | column

echo -e "\n ------------------------------------------- \n"

# Optionally pass y flag to skip prompt, ./file.sh -y
ARG1=$1
if [[ $ARG1 =~ ^(-[yY])+$ ]]; then
  copyfiles
  completed
  exit 1
fi


read -p "Do you want to copy the above files to ${HOME} folder [y/N]?: " yn

if [[ $yn =~ ^([yY])+$ ]]; then
  copyfiles
  completed
else
  echo "Exiting..."
fi

