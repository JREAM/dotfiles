# dotfiles

This can be cloned on it's own, but it's part of my `config-ubuntu` submodule.

## Update Git
You should update the git config with:
```
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

If you are using another default identity key other than `id_rsa/id_rsa.pub` make sure to update it:
```
git config --global user.IdentityFile "~/.ssh/your_private_key"
```

## Vim Plugins
To install vim plugins the following will suffice to clone Vundle:
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Once cloned to your user folder, install the plugins all at once:
```
vim +PluginInstall +qall
```

You will see an error with the color scheme, but when you reload vim it will fix itself.
