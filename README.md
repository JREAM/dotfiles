# DotFiles

[TOC]

---

## Main Dotfiles

| File                   | Purpose                                  |
| ---------------------- | ---------------------------------------- |
| `.bashrc`              | Main script to run `. ~/.bashrc` on, reloads all sub-scripts below |
| `.bash_vendors`        | Any third-party add-ons such as `pyenv`, `nvm`, etc. |
| `.bash_vars`           | Exported variables to re-use in bash     |
| `.bash_completions_ng` | Optional angular cli completions (`npm i -g angular/cli`) |
| `.bash_aliases`        | All shortcuts to make things easier!     |
| `.exports`             | Basic export options                     |
| `.exports_private`     | (Optional) Private export file to ignore with git when public |

> **How To Update**: All files are loaded from `.bashrc`, so if you change and sub-file simply reload it with `source ~/.bashrc` or `. ~/.bashrc`.

## Aliases List

This is found in the `.bash_aliases` file.

- **Bash PS1 Display** 
  - `username@host[~/path]:~$`
  - `username@host[~/path (master)]:~$` _(Git Branches)_

### Navigation Shortcuts

| Alias  | Actual Command        | Description                              |
| ------ | --------------------- | ---------------------------------------- |
| `..`   | `cd ..`               | Move up one directory                    |
| `...`  | `cd ../..`            | Move up two directories                  |
| `....` | `cd ../../..`         | Move up three directories                |
| `l`    | `ls -l --color=auto`  | Long Listing with Color                  |
| `la`   | `ls -la --color=auto` | Long Listing with Hidden Files and Color |
| `ls`   | `ls --color=auto`     | List with Color                          |
| `p`    | `cd ~/projects`       | Go to specific Folder                    |
| `www`  | `cd /var/www`         | Go to specific Folder                    |

### APT Shortcuts

| Alias        | Actual Command                           | Description              |
| ------------ | ---------------------------------------- | ------------------------ |
| `apt`        | `sudo apt-get`                           | Prefix `sudo`            |
| `update`     | `sudo apt-get update`                    | Quick Update             |
| `updatey`    | `sudo apt-get update && sudo apt-get upgrade -y` | Quick Upgrade w/Auto Yes |
| `upgrade`    | `sudo apt-get upgrade`                   | Upgrade                  |
| `autoremove` | `sudo apt autoremove`                    | Quick Auto Remove        |
| `autoclean`  | `sudo apt autoclean`                     | Quick Auto Clean         |
| `ppa`        | `sudo apt-add-repository`                | Quickly add PPA          |

### Sudo Shortcuts

| Alias   | Actual Command          | Description                  |
| ------- | ----------------------- | ---------------------------- |
| `root`  | `sudo -i`               | Get to root easier           |
| `su`    | `sudo -i`               | Get to root easier           |
| `sudo`  | `sudo`                  | Allows aliases to use `sudo` |
| `chgrp` | `chgrp --preserve-root` | Protect root folder(s)       |
| `chmod` | `chmod --preserve-root` | Protect root folder(s)       |
| `chown` | `chown --preserve-root` | Protect root folder(s)       |
| chown          | chown --preserve-root                    | Protect root / folder      

### Service Shortcuts

| Alias        | Actual Command                           | Description                       |
| ------------ | ---------------------------------------- | --------------------------------- |
| `service`    | `sudo service`                           | Shorthand service                 |
| **Apache2**  |                                          |                                   |
| `a2ctl`      | `sudo apachectl`                         | Apache Control Utility            |
| `a2graceful` | `sudo /usr/sbin/apachectl -k graceful`   | Graceful Restart                  |
| `a2modules`  | `sudo apachectl -t -D DUMP_MODULES`      | List Active Modules               |
| `a2test`     | `sudo apachectl -t`                      | Config Test                       |
| `a2start`    |                                          | Start Apache                      |
| `a2stop`     |                                          | Stop Apache                       |
| `a2graceful` | `sidp /usr/sbin/apachectl -k graceful`   | Restart Gracefully                |
| `a2restart`  |                                          | Restart Apache                    |
| `a2reload`   |                                          | Reload Apache                     |
| `a2version`  | `sudo apachectl -v`                      | Get Version                       |
| `a2vhosts`   | `sudo apachectl -t -D DUMP_VHOSTS`       | List Active VHosts                |
| `a2path`     |                                          | Go to Apache Config Path          |
| `a2enconf`   | `sudo a2enconf`                          | Enable Configuration              |
| `a2disconf`  | `sudo a2disconf`                         | Disable Configuration             |
| `a2ensite`   | `sudo a2ensite`                          | Enable VHost                      |
| `a2dissite`  | `sudo a2dissite`                         | Disable Vhost                     |
| `a2log`      | `tail -n 50 /var/log/apache2/error.log`  | See Recent Error Log              |
| `a2access`   | `tail -n 50 /var/log/apache2/access.log` | See Recent Access Log             |
| **Nginx**    |                                          |                                   |
| `ngmake`     |                                          | Create file in sites-available    |
| `ngensite`   |                                          | Create symlink to sites-enabled   |
| `ngdissite`  |                                          | Remove symlink from sites-enabled |
| `ngstart`    |                                          | Start Nginx                       |
| `ngstop`     |                                          | Stop Nginx                        |
| `ngreload`   |                                          | Reload Nginx                      |
| `ngrestart`  |                                          | Restart Nginx                     |
| `ngtest`     |                                          | Config Test                       |
| `ngpath`     |                                          | Go to Nginx Config Path           |


### Utility Shortcuts
| Alias     | Actual Command | Description                       |
| --------- | -------------- | --------------------------------- |
| `df`      |                | improvement (`apt insttall pydf`) |
| `du`      |                | improvement (`apt install ncdu`)  |
| `gza`     |                | GZip an current folder            |
| `extract` |                | extract nearly any file extension |

### Search Shortcuts

| Alias   | Actual Command       | Description       |
| ------- | -------------------- | ----------------- |
| `egrep` | `egrep --color=auto` | Color to egrep    |
| `ffile` | `find . -name`       | find file by name |
| `fgrep` | `fgrep --color=auto` | Color to fgrep    |
| `grep`  | `grep --color=auto`  | Color to grep     |

### Misc Shortcuts
| Alias            | Actual Command    | Description                              |
| ---------------- | ----------------- | ---------------------------------------- |
| `h`              | `history`         | View Bash History                        |
| `c`              | `clear`           | Clear Terminal                           |
| `gitall`         |                   | Get all current repo branches            |
| `gitallbranches` |                   | Fetches all git branches in a repository |
| `ip`             |                   | get current ip                           |
| `j`              | `jobs -l`         | Show running jobs                        |
| `mkdir`          | `mkdir -pv`       | Make directories multi-levels deep       |
| `now`            |                   | Current Date Time                        |
| `os`             | `lsb_release -a`  | OS Info                                  |
| `ports`          | `netstat -tulanp` | Open Ports                               |
| `py`             | `python`          | Shorthand Python                         |
| `vi`             | `vim`             | Always use VIM                           |
| `wget`           | `wget -c`         | Continue if failed download              |
| `xclip`          | `xclip -sel clip` | Copy content                             |

## Important: Update Git Settings

You should update the git config with:

```sh
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

If you are using another default identity key other than `id_rsa/id_rsa.pub` make sure to update it:

```sh
git config --global user.IdentityFile "~/.ssh/your_private_key"
```

## 

## Vim Plugins

To install vim plugins the following will suffice to clone Vundle:

```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Once cloned to your user folder, install the plugins all at once:

```sh
vim +PluginInstall +qall
```

You will see an error with the color scheme, but when you reload VIM it will fix itself.


# Dev Environment Setup

I have used the following:
- Node: `8.1.0`
- NPM: `5.0.3`
- OS:
  - `Windows 10 x64`,
  - `Ubuntu 16.04 x64`,
  - `Ubuntu 16.10 x64`,
  - *Sorry I don't use Apple*

I like to use use NVM, it's up to you.

### Linux: Install Environment Essentials

DirEnv uses `.envrc` files
```sh
sudo apt install direnv
```

Add DirEnv to detect `.envrc` in `.bashrc`:
```sh
# This should be near the end, or the end of your .bashrc file
if type direnv 2>/dev/null; then
  eval "$(direnv hook bash)"
else
  echo "[!] You need 'direnv', apt install direnv"
fi
```

## Get Node/NVM/Update NPM

Download NVM
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
```

### Install Node and Update NPM
```
nvm install 8.1.0
nvm use 8.1.0
npm install -g npm
```

If you need to force a version, make an `.nvmrc` alongside an `.envrc` below with:
```
8.1.0
```

### Force Enviroment Versions
The `.envrc` contains:
```
nvmrc=~/.nvm/nvm.sh
if [ -e $nvmrc ]; then
  source $nvmrc
  nvm use
fi

# Path to node modules
PATH_add node_modules/.bin
```

## Ubuntu XML Linter
For XML Linting, add the following:

```
sudo apt install libxml2-utils
```

## PHP
```sh
composer global require friendsofphp/php-cs-fixer \
  squizlabs/php_codesniffer \
  phpmd/phpmd behat/behat \
  codeception/codeception
```

Always make sure composer path is included, preferably in `.profile` or `.bashrc`:

```sh
export PATH="$PATH:$HOME/.composer/vendor/bin"
```

> Global Windows NPM Location: `C:\Users\inno\AppData\Roaming\npm`

> Global Windows Composer Location: `C:\Users\inno\AppData\Roaming\Composer\vendor`


## Python Linters

```sh
pip install pep8 pylint flake8 pydocstyle prospector pylint_django ansible-lint
```

If you have Py3.X installed also add:
```sh
pip3 install mypy-lang
```

## Node JS Linters & Tools

**Important** When using NVM, you may have different
packages installed globally, so run: `npm list` to see.

### Dependencies First
Add many items to be the most compatible, you can also use `yarn` if you have it installed.

**This is only tested on Node 6+**

```sh
npm install -g --save \
  cross-env \
  babel-cli \
  babel-core \
  babel-eslint \
  babel-helpers \
  babel-messages \
  babel-preset-es2015 \
  babel-preset-es2016 \
  babel-preset-stage-1 \
  babel-preset-stage-2 \
  babel-preset-stage-3 \
  babel-plugin-transform-es2015-modules-commonjs \
  babel-polyfill \
  babel-register \
  babel-types \
  babel-template \
  csslint \
  eslint \
  eslint-config-eslint \
  eslint-plugin-flowtype \
  htmlhint \
  htmllint-cli \
  less \
  jscs \
  jshint \
  jsxhint \
  phplint \
  sass-lint \
  sass-lint \
  tslint \
  typescript
```

### Setup Eslint Config

Create `.eslintrc`, place it someplace common to share, the easiest place is your home folder to keep all projects consistent.

```json
// ~/home/user/.eslintrc
// Many items are optional, please see eslint config
{
  "parserOptions": {
    "ecmaVersion": 6,
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "env": {
    "browser": true,
    "jquery": true,
    "node": true,
    "phantomjs": true
  },
  "extends": "eslint"
}

```

## Ruby

For `rainbow, nokogiri, sass` you may have to use Ruby `2.1.X` since there is a bug at the moment for `2.4`.

The item `mdl` is Markdown Lint, `compass` is no longer supported.

```sh
sudo gem install markdown mdl bundler rake rainbow nokogiri
```


# Configure PHP Settings for IDE

> Path to phpcs for editors: `/home/jesse/.composer/vendor/bin/phpcs`
> Path to phpmd (mess detector): `/home/jesse/.composer/vendor/bin/phpmd`

This is optional, but set PHP version may help:

```
php -a
php> echo PHP_VERSION_ID;
```

- **For example, I receive:**
  - Ubuntu: `70018`
  - Windows Laragon: `70105`

We would then run the following for any platform:

```sh
phpcs --config-set php_version <version_id>

# Example:
phpcs --config-set php_version 70018
```

Other cross platform PHPCS commands to set are:

```sh
phpcs --config-set default_standard Squiz
phpcs --config-set report_format summary
phpcs --config-set colors 1
phpcs --config-set report_width 120
phpcs --config-set encoding utf-8
phpcs --config-set tab_width 4
```

## Linter Settings: Ubuntu

You can Copy/Paste all this into your terminal.

```
phpcs --config-set php_path /usr/bin/php

## Set a reusable var, save time
BASE_PATH=/home/${USER}/.npm/
phpcs --config-set csslint_path $BASE_PATH/csslint/dist/csslint.js    # CSS Lint
phpcs --config-set jslint_path $BASE_PATH/jslint/lib/jslint.js        # JS LINT [Letter L]

phpcs --config-set jshint_path $BASE_PATH/jshint/dist/jshint.js       # JS Hint [Letter H]
phpcs --config-set rhino_path $BASE_PATH/jshint/dist/jshint.js        # JS Hint [Letter H]
phpcs --config-set rhino_path $BASE_PATH/jshint/dist/jshint-rhino.js  # JS Hint [Letter H]
```

## Linter Settings: Windows

First set your **PHP CS** SETTINGS, on windows we have to know where PHP is installed.

Find your PHP path, assuming it's set in Windows Environment Variables.

```sh
which php
```

Using MingGW64 (Git Bash from GitSCM) I get:
```
/c/laragon/bin/php/php-7.1.5-Win32-VC14-x64/php
```

**So, My setting is:**

```
phpcs --config-set php_path /c/laragon/bin/php/php-7.1.5-Win32-VC14-x64/php
```

### All Linter Settings

You can Copy/Paste all this into your terminal. *Reminder: I am using MinGW on Windows here.*

```sh
BASE_PATH=/c/Users/$(whoamai)/AppData/Roaming/npm/node_modules/             # Usually the default -g/--global install path in Windows
phpcs --config-set csslint_path $BASE_PATH/csslint/dist/csslint.js    # CSS Lint
phpcs --config-set jslint_path $BASE_PATH/jslint/lib/jslint.js        # JS LINT [Letter L]

phpcs --config-set jshint_path $BASE_PATH/jshint/dist/jshint.js       # JS Hint [Letter H]
phpcs --config-set rhino_path $BASE_PATH/jshint/dist/jshint.js        # JS Hint [Letter H]
phpcs --config-set rhino_path $BASE_PATH/jshint/dist/jshint-rhino.js  # JS Hint [Letter H]
```

## Jetbrains and Laravel

```
composer require --dev barryvdh/laravel-ide-helper
```

Then go to `app/Providers/AppServiceProvider.php`:

```
# In the register() method add:
public function register()
{
    if ($this->app->environment() !== 'production') {
        $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
    }
    // ...
}
```

Generate Docs:
```
php artisan ide-helper:generate
php artisan ide-helper:meta
```

## Sublime Outline Scope (Disregard)

I like this feature to outline a scope, it requires `BracketHighlighter`.

Go to `Preferences` > `Browse Packages` and head into the `User` folder.

Now edit your currently active theme, it ends with `.tmTheme`. Add the following around line `64-ish` after you see:

```xml
<array>
    <dict>
        <key>settings</key>
        <dict>
            <key>...</key>
            <string>...</string>
        </dict>
    </dict>
    ... Here ...
</array>
```

You will add this, and you can adjust the `#525252` to any color you want, don't
worry about the `foreground` word:
```xml
<dict>
    <key>name</key>
    <string>BracketHighlighter</string>
    <key>scope</key>
    <string>comment.block.custom</string>
    <key>settings</key>
    <dict>
        <key>foreground</key>
        <string>#525252</string>
    </dict>
</dict>
```

Next go to `Preferences` > `Package Settings` > `Bracket Highlighter`, and we
will add the following:

```
I dont know its hard to get right, pain in the butt... gotta add xml
to the CURRENT theme
```

The above creates a file in `Users/bh_core.sublime-settings`.

---

Disclaimer: Not all Features are flawless, many things are experimental and change often.

License: Open Source MIT

(C) 2017 Jesse Boyer <[JREAM LLC](https://jream.com)>
