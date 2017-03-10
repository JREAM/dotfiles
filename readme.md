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

## Bashrc
- Bash Display: `username@host[~/path]:~$`
- Aliases:
    - `ngmake <project>` - make an nginx file in sites-available
    - `ngenable <project>` Enable an nginx site with, a symlink
        - *You must restart nginx for it to take effect*
    - `ngdisable <project>` Disable an nginx site removing, the symlink
        - *You must restart nginx for it to take effect*
    - `l` runs `ls -l --color`
    - `la` runs `ls -la -l --color`
    - `..` runs `cd ..`
    - `...` runs `cd ../..`
    - `....` runs `cd ../../..`
    - `xclip` runs `xclip -sel clip`
        - eg: `cat file.txt | xclip` to copy.
    - `ffile <text>` runs `find . -name `
    - `ftext <text>` finds files containing text in current path.
    - `apt-get` runs `sudo apt-get`
    - `mkdir` runs `mkdir -pv` to make nested directories
        - eg: `mkdir project/jream/files` creates a nested tree.
    - `h` runs `history`
    - `j` runs `jobs -l`
    - `p` alias goes to `~/projects`
    - `www` alias goes to `www`
    - `vi` runs `vim`
    - `ports` runs `netstat -tulnap



## Vim Plugins
To install vim plugins the following will suffice to clone Vundle:
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Once cloned to your user folder, install the plugins all at once:
```
vim +PluginInstall +qall
```

You will see an error with the color scheme, but when you reload VIM it will fix itself.

## Compiz Settings
This only applies to GUI's. I am using Ubuntu with Gnome 3.

- **Window Hotkeys**
- `Super+Alt+Up` Move to Top of screen
- `Super+Alt+Down` Move to Bottom of screen
- `Super+Alt+Left` Move to Left of screen
- `Super+Alt+Right` Move to Right of screen

- `Super+Ctrl+Up` Maximize Window
- `Super+Ctrl+Down` Restore Window from Maximum State
- `Super+Ctrl+Left` Maximize Window to Left (Half Screen)
- `Super+Ctrl+Right` Maximize Window to Right (Half Screen)

- `Ctrl+Alt+Up` Move Workspace Up
- `Ctrl+Alt+Down` Move Workspace Down

- `Ctrl+Alt+Shift+Up` Move Focused Window a Workspace Up
- `Ctrl+Alt+Shift+Down` Move Focused Window a Workspace Down

- `Shift+Drag Window` Snap to Other Window Edges
