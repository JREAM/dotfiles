# dotfiles

<!-- TOC -->

- [dotfiles](#dotfiles)
    - [Update Git](#update-git)
    - [.bashrc](#bashrc)
        - [Aliases](#aliases)
    - [Vim Plugins](#vim-plugins)
    - [Compiz Settings](#compiz-settings)

<!-- /TOC -->

This can be cloned on it's own, and it's part of my `config-ubuntu` sub-module.

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

## .bashrc
Bash Display: `username@host[~/path]:~$`

### Aliases
| Alias | Command | Purpose |
| --- | --- | --- |
| **Navigation** | | |
| .. | cd .. | move up a directory |
| ... | cd ../.. | move up two directories |
| .... | cd ../../.. | move up thre directories |
| l | ls -l --color | ls long listing & shortcut w/color |
| la | ls -la --color | ls long listing + dotfiles & shortcut w/color |
| ls | command ls --color | ls with color |
| p | cd ~/projects/ | go to folder |
| www | cd /var/www/ | go to folder |
| **Apt** | |
| apt-get | sudo apt-get | prefix sudo when forgotten |
| update | sudo apt-get update | shortcut to update |
| updatey | sudo apt-get update && sudo apt-get upgrade | shortcut to update & upgrade |
| **Apache2** | |
| a2graceful | sudo /usr/sbin/apachectl -k graceful | Graceful Restart |
| a2modules | sudo apachectl -t -D DUMP_MODULES | List Active Modules |
| a2test | sudo apachectl -t | Test Config |
| a2version | sudo apachectl -v | Get Version |
| a2vhosts | sudo apachectl -t -D DUMP_VHOSTS | List Active VHosts |
| **Nginx** | | |
| ngmake |  | Create file in sites-available |
| ngensite |  | Create symlink to sites-enabled |
| ngdissite |  | Remove symlink from sites-enabled |
| ngreload | | nginx reload |
| ngtest |  | nginx configtest |
| **Safety** | | |
| chgrp | chgrp --preserve-root | Protect root / folder |
| chmod | chmod --preserve-root | Protect root / folder |
| chown | chown --preserve-root | Protect root / folder |
| **Super User** | | |
| root | sudo -i | Get to root easier |
| su | sudo -i | Get to root easier |
| sudo | sudo  | Allow Aliases to use sudo |
| **Utils** | | |
| df |  | improvement (apt insttall pydf) |
| du |  | improvement (apt insttall ncdu) |
| gza | | gzip an current folder |
| **Searching** | | |
| egrep | egrep --color=auto | Color to egrep |
| ffile | find . -name | find file by name |
| fgrep | fgrep --color=auto | Color to fgrep |
| grep | grep --color=auto | Color to grep |
| **Python** | | |
| mkvirtualenv | | --no-site-packages --distribute  |
| **Shortcuts** | | |
| h |  | history |
| c |  | clear |
| gitall |  | get all current repo branches |
| ip |  | get current ip |
| j | jobs -l |  |
| mkdir | mkdir -pv | Make directories multi-levels deep |
| now |  | Current Date Time |
| os | lsb_release -a | OS Info |
| ports | netstat -tulanp | Open Ports |
| vi | vim | Always use VIM |
| wget | wget -c | Continue if failed download |
| xclip | xclip -sel clip | Copy content |

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

| **Window Hotkeys** ||
| --- | --- |
|`Super+Alt+Up` | Move to Top of screen |
|`Super+Alt+Down` | Move to Bottom of screen |
|`Super+Alt+Left` | Move to Left of screen |
|`Super+Alt+Right` | Move to Right of screen |
|`Super+Left` | Maximize to half left of screen |
|`Super+Right` | Maximize to half right of screen |
|`Super+Ctrl+Up` | Maximize Window |
|`Super+Ctrl+Down` | Restore Window from Maximum State |
|`Super+Ctrl+Left` | Maximize Window to Left (Half Screen) |
|`Super+Ctrl+Right` | Maximize Window to Right (Half Screen) |
|`Ctrl+Alt+Up` | Move Workspace Up |
|`Ctrl+Alt+Down` | Move Workspace Down |
|`Ctrl+Alt+Shift+Up` | Move Focused Window a Workspace Up |
|`Ctrl+Alt+Shift+Down` | Move Focused Window a Workspace Down |
|`Shift+Drag Window` | Snap to Other Window Edges |

