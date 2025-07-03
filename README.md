# DotFiles

[TOC]

---

## Install Dotfiles

- These should go in `$XDG_CONFIG_HOME` which is `$HOME/.config/` by default.
- Running `./cp-dotfiles.sh` will:
	- Ask if you want to `copy` dotfiles from this repos root directory to your `$HOME` folder
	- Ask if you want to copy `config/*` folders to your `$XDG_CONFIG_HOME` path.
			- _NOTE_: There are many dotfiles besides bash only.

## Load Order
The default load order of files is:
0. /etc/proifile - Global profile (Don't touch)
1. `~/.bash_profile` - Only applies to bash
2. `~/.bash_login` - Only applies to bash
3. `~/.profile` - Any login shell

And from one of those it's common to source `~/.bashrc`.

## File Overview

Some files are as follows

| File                   | Purpose                                  |
| ---------------------- | ---------------------------------------- |
| `.bash_profile`        | First Load (Startup) | Use .profile for non-bash shells. Primarily for Ubuntu 18 LTS |
| `config/bash/.bashrc`              | Main script to run `. ~/.bashrc` on, reloads all sub-scripts below |
| `config/bash/api`        | (Excluded from Git) for setting env variables for API's |
| `config/bash/vendor`        | Any third-party add-ons such as `pyenv`, `nvm`, etc. |
| `config/bash/colors`           | Exported variables to re-use in bash     |
| `config/bash/fn`           | Utility Functions (fn) for CLI |
| `config/bash/alias`        | All my shortcuts to make things easier!     |
| `config/bash/includes/*`        | Auto-included files on run (make functions/aliases or it will run everytime)     |
| `config/git/config`           | Global Git config, Run your commands to customize (Below) |
| `config/git/ignoire`           | Global Git ignore |

> **How To Update**: All files are loaded from `.bashrc`, so if you change and sub-file simply reload it with `source ~/.bashrc` or `. ~/.bashrc`.

## Git Quick Customize

Run these commands to add your info:

```
git config --global user.name "Yourname"
git config --global user.email "youremail@somewhere.com"

# If your main SSH key is id_rsa set it like below, otherwise replace the name.
git config --global user.IdentityFile "~/.ssh/id_rsa"

# If key needs to be added
ssh-add ~/.ssh/id_rsa

eval ssh-agent -s  # If you need to restart ssh agent
```

A Few shortcuts (See `~/.gitconfig`) for more:

|  Command              |  Purpose                                                    |
| --------------------- | ----------------------------------------------------------- |
|  `gl:me/repo`         |  GitLab SSH                                                 |
|  `gh:me/repo`         |  GitHub SSH                                                 |
|  `git cl gh:me/repo`  |  Clone from GitHub: `git clone git@github.com:me/repo.git`  |
|  `git cm "msg"`       |  `git commit -m "message"`                                  |
|  `git r`              |  `git reset`                                                |
|  `git br`             |  `git branch`                                               |
|  `git ra`             |  `git remote add origin`                                    |
|  `git ups`            |  `git --set-upstream origin`                                |
|  `git co`             |  `git checkout`                                             |
|  `git st`             |  `git status`                                               |

> Note: This adds the shortcut in your `~./git/config` file project as the short
version so be aware of that when creating a new project.


## Aliases List

This is found in the `.bash_aliases` file.

- **Bash PS1 Display**
  - `username@host[~/path]:~$`
  - `username@host[~/path (master)]:~$` _(Git Branches)_

### Navigation Shortcuts

|  Alias   |  Actual Command         |  Description                               |
| -------- | ----------------------- | ------------------------------------------ |
|  `..`    |  `cd ..`                |  Move up one directory                     |
|  `...`   |  `cd ../..`             |  Move up two directories                   |
|  `....`  |  `cd ../../..`          |  Move up three directories                 |
|  `l`     |  `ls -l --color=auto`   |  Long Listing with Color                   |
|  `la`    |  `ls -la --color=auto`  |  Long Listing with Hidden Files and Color  |
|  `ls`    |  `ls --color=auto`      |  List with Color                           |
|  `p`     |  `cd ~/projects`        |  Go to specific Folder                     |
|  `www`   |  `cd /var/www`          |  Go to specific Folder                     |

### APT Shortcuts

|  Alias         |  Actual Command                                    |  Description               |
| -------------- | -------------------------------------------------- | -------------------------- |
|  `apt`         |  `sudo apt-get`                                    |  Prefix `sudo`             |
|  `update`      |  `sudo apt-get update`                             |  Quick Update              |
|  `updatey`     |  `sudo apt-get update && sudo apt-get upgrade -y`  |  Quick Upgrade w/Auto Yes  |
|  `upgrade`     |  `sudo apt-get upgrade`                            |  Upgrade                   |
|  `autoremove`  |  `sudo apt autoremove`                             |  Quick Auto Remove         |
|  `autoclean`   |  `sudo apt autoclean`                              |  Quick Auto Clean          |
|  `ppa`         |  `sudo apt-add-repository`                         |  Quickly add PPA           |

### Sudo Shortcuts

|  Alias    |  Actual Command           |  Description                   |
| --------- | ------------------------- | ------------------------------ |
|  `root`   |  `sudo -i`                |  Get to root easier            |
|  `su`     |  `sudo -i`                |  Get to root easier            |
|  `sudo`   |  `sudo`                   |  Allows aliases to use `sudo`  |
|  `chgrp`  |  `chgrp --preserve-root`  |  Protect root folder(s)        |
|  `chmod`  |  `chmod --preserve-root`  |  Protect root folder(s)        |
|  `chown`  |  `chown --preserve-root`  |  Protect root folder(s)        |

### Utility Shortcuts
|  Alias      |  Actual Command  |  Description                        |
| ----------- | ---------------- | ----------------------------------- |
|  `df`       |                  |  improvement (`apt insttall pydf`)  |
|  `du`       |                  |  improvement (`apt install ncdu`)   |
|  `gza`      |                  |  GZip an current folder             |
|  `extract`  |                  |  extract nearly any file extension  |

### Search Shortcuts

|  Alias    |  Actual Command        |  Description        |
| --------- | ---------------------- | ------------------- |
|  `egrep`  |  `egrep --color=auto`  |  Color to egrep     |
|  `ffile`  |  `find . -name`        |  find file by name  |
|  `fgrep`  |  `fgrep --color=auto`  |  Color to fgrep     |
|  `grep`   |  `grep --color=auto`   |  Color to grep      |

### Misc Shortcuts
|  Alias              |  Actual Command     |  Description                                   |
| ------------------- | ------------------- | ---------------------------------------------- |
|  `h`                |  `history`          |  View Bash History                             |
|  `c`                |  `clear`            |  Clear Terminal                                |
|  `gitall`           |                     |  Get all current repo branches                 |
|  `gitallbranches`   |                     |  Fetches all git branches in a repository      |
|  `ip`               |                     |  get current ip                                |
|  `j`                |  `jobs -l`          |  Show running jobs                             |
|  `mkdir`            |  `mkdir -pv`        |  Make directories multi-levels deep            |
|  `now`              |                     |  Current Date Time                             |
|  `os`               |  `lsb_release -a`   |  OS Info                                       |
|  `ports`            |  `netstat -tulanp`  |  Open Ports                                    |
|  `pnpm`             |  `netstat -tulanp`  |  Open Ports                                    |
|  `py`               |  `python`           |  Shorthand Python                              |
|  `vi`               |  `vim`              |  Always use VIM                                |
|  `ssh-permissions`  |                     |  Updates ~/.ssh folder, private and .pub keys  |
|  `wget`             |  `wget -c`          |  Continue if failed download                   |
|  `xclip`            |  `xclip -sel clip`  |  Copy content                                  |

---


Disclaimer: Not all Features are flawless, many things are experimental and change often.

License: Open Source MIT

(C) 2017-2025 Jesse Boyer <[JREAM LLC](https://jream.com)>
