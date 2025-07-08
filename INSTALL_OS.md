# Fresh Linux Install Guide

For a quick setup with Zorin 17 or Ubuntu 22+.

---

<!-- TOC -->

- [Fresh Linux Install Guide](#fresh-linux-install-guide)
  - [Initial System Configuration](#initial-system-configuration)
    - [Set Higher File Watcher Limit](#set-higher-file-watcher-limit)
    - [Keybindings](#keybindings)
    - [Configure XDG User Directories](#configure-xdg-user-directories)
    - [Create Directory for APT Keyrings](#create-directory-for-apt-keyrings)
  - [Package Manager & Repositories](#package-manager--repositories)
  - [Application Installation](#application-installation)
    - [Manual Installation Desktop Apps](#manual-installation-desktop-apps)
    - [AppImage Launcher Maybe](#appimage-launcher-maybe)
    - [Install Packages via APT](#install-packages-via-apt)
      - [Core System & CLI Tools](#core-system--cli-tools)
  - [Language Runtimes & Tooling](#language-runtimes--tooling)
    - [Go](#go)
    - [Rust](#rust)
    - [Lua](#lua)
    - [PNPM Node LTS  / Bun / Deno](#pnpm-node-lts---bun--deno)
    - [Python](#python)
    - [PHP Build Dependencies](#php-build-dependencies)
  - [Development Tool Installation & Configuration](#development-tool-installation--configuration)
    - [Dotfiles](#dotfiles)
    - [GitHub CLI](#github-cli)
    - [FZF Fuzzy Finder](#fzf-fuzzy-finder)
    - [More Dev Tools](#more-dev-tools)
    - [Docker Permissions](#docker-permissions)
    - [PostgreSQL & pgAdmin](#postgresql--pgadmin)
  - [Desktop & System Customization](#desktop--system-customization)
    - [Default Terminal Setup](#default-terminal-setup)
    - [Custom Fonts](#custom-fonts)
    - [System Tool Configuration](#system-tool-configuration)
    - [GNOME Settings Tweaks](#gnome-settings-tweaks)
  - [Specific Hardware](#specific-hardware)
  - [Thinkpad T480s / L390](#thinkpad-t480s--l390)
    - [Logitech MX Master 3 Setup logiops](#logitech-mx-master-3-setup-logiops)

<!-- /TOC -->
## 1. Initial System Configuration

These commands tweak essential system settings.

### Set Higher File Watcher Limit
Increases the number of files the system can monitor for changes. This is crucial for development environments and tools like VS Code.
```bash
echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

### Keybindings

When `git clone https://github.com/jream/dotfiles.git ~/dotfiles` is run, and installed set the hotkey to this command for single instance terminator.
Right now it only works in X11 not XWayland.

```
CTRL + Alt + T
/home/jesse/.config/bash/toggle-terminal.sh
```

```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal ''
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>t't

#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>t'

```


### Configure XDG User Directories
Prevents applications from creating default user directories (`~/Documents`, `~/Music`, etc.). Set your preferred locations in the `user-dirs.dirs` file.
[More Info](https://wiki.archlinux.org/title/XDG_user_directories)
```bash
# Open this file and set directories to $HOME or another preferred location
vim ~/.config/user-dirs.dirs

# Apply the changes and make the config file immutable
xdg-user-dirs-gtk-update
chmod -w ~/.config/user-dirs.dirs
```


### Create Directory for APT Keyrings
Creates a dedicated, secure directory for managing APT repository keys.
```bash
sudo mkdir -p /etc/apt/keyrings
```


---

## 2. Package Manager & Repositories

This section adds all necessary third-party repositories (PPAs) and updates package lists.

```bash
# Add PPAs for various tools
sudo add-apt-repository ppa:apt-fast/stable -y
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable -y
sudo add-apt-repository ppa:touchegg/stable -y

# Add Albert Launcher repository
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null

# Add GitHub CLI repository
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Add pgAdmin repository
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# Update all package lists
sudo apt update
```

---

## 3. Application Installation

### Manual Installation (Desktop Apps)

These applications require downloading a `.deb` package and installing it manually.

- **Google Chrome**: [Download Link](https://www.google.com/chrome/)
- **Dropbox**: [Download Link](https://www.dropbox.com/install-linux)

### AppImage Launcher (Maybe)
Integrates AppImages with your system for easy access.
[Download from GitHub](https://github.com/TheAssassin/AppImageLauncher/releases)
```bash
# Example installation for a downloaded .deb file
cd ~/Downloads
# Make sure to get the latest version from the releases page
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo dpkg -i appimagelauncher_*.deb
rm appimagelauncher_*.deb
```


### Install Packages via APT

A comprehensive list of essential tools, utilities, and fonts installed from the default repositories.

#### Core System & CLI Tools

- Run this all in one setting.
- May need to accept set `apt-fast` to `12` and confirm
- May need to accept font EULA

```bash
sudo apt install -y \
  acl apt-fast apt-transport-https ca-certificates curl dconf-editor direnv dmidecode \
  ethtool fsearch gawk genisoimage git git-lfs gnupg2 gparted grc hardinfo htop httpie \
  hwinfo inetutils-tools inotify-tools iperf iw jq libinput-tools moreutils most ncdu \
  neofetch net-tools netperf nmap openssh-client openssh-server p7zip-full preload pydf \
  rename ripgrep screen slurp software-properties-common sqlite3 sshfs stow sway synaptic \
  sysbench task-spooler tcptrack terminator tree ttf-mscorefonts-installer ubuntu-keyring \
  unp unzip vim watchman wget whois wmctrl xbindkeys xclip xdotool xmlto xsel \
  xserver-xorg-input-synaptics;
  ###### Development Essentials \
  sudo apt install -y \
  build-essential default-jdk libreadline-dev make meld musl musl-dev musl-tools \
  gcc pkg-config libev-dev libx11-dev libxi-dev \
  mycli postgresql python3-dev python3-pip python3-setuptools \

  ###### Helper Utilities & Fun Stuff
  bash-completion bat bmon ccze chrome-gnome-shell colordiff ctop ddgr duf exa \
  fd-find hyperfine lolcat lsb-core lsb-release lsscsi menulibre touchegg ydotool;

  ###### Fonts
  sudo apt install -y \
  font-manager fonts-firacode fonts-font-awesome fonts-hack fonts-monoid \
  fonts-open-sans fonts-powerline fonts-roboto;

  ###### Gnome Specific
  sudo apt install -y \
  chrome-gnome-shell gnome-shell-extension-prefs gnome-tweaks
```

---

## 4. Language Runtimes & Tooling

Install and configure runtimes for various programming languages.

### Go
```bash
cd ~/Downloads
wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz -O go.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
# Add to your shell profile (e.g., ~/.bashrc or ~/.zshrc):
# export PATH=$PATH:/usr/local/go/bin
```


### Rust
```bash
curl https://sh.rustup.rs -sSf | sh

# argc (A tool for creating feature-rich CLIs in bash)
cargo install argc
# This loads or focuses an instance for hotkeys
cargo install run-or-raise
```


### Lua
```bash
sudo apt install lua5.4 -y
```


### PNPM (Node LTS)  / Bun / Deno
```bash
# PNPM (Fast, disk space efficient package manager)
curl -fsSL https://get.pnpm.io/install.sh | sh -
source ~/.bashrc
pnpm
pnpm env use -g lts

# Deno
curl -fsSL https://deno.land/install.sh | sh

# Bun
curl -fsSL https://bun.sh/install | bash
```

### Python
```bash
# Create symlinks for python3
sudo ln -sf /usr/bin/python3 /usr/bin/python
sudo ln -sf /usr/bin/python3 /usr/bin/py

# Install uv (a very fast Python package installer and resolver)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install pipx (for installing python CLI tools in isolated environments)
pip install pipx
```

### PHP Build Dependencies
```bash
sudo apt install -y \
  libbz2-dev libjpeg-dev libonig-dev libpng-dev libsqlite3-dev \
  libtidy-dev libxslt1-dev libzip-dev libxml2 libxml2-dev
```

---

## 5. Development Tool Installation & Configuration

Dotfiles are my personal files, disregard if this is shared publicly.

### Dotfiles
```bash
git clone https://github.com/jream/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./cp-dotfiles.sh
git clone https://github.com/jream/config-ubuntu.git ~/config-ubuntu
```

### GitHub CLI
```bash
sudo apt install gh -y
```


### FZF (Fuzzy Finder)
Install from source because the Apt version can be outdated.

```bash
# Select No/No during install if you have fzf settings in your dotfiles
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```


### More Dev Tools
```bash
# Broot (A better file navigator for the terminal)
curl https://dystroy.org/broot/download/x86_64-linux/broot -o broot && \
  sudo chmod +x broot && \
  ./broot --install && \
  sudo mv broot /usr/local/bin
```

### Docker Permissions
Run these commands after installing Docker Desktop to manage Docker without `sudo`.
```bash
sudo groupadd docker
sudo usermod -aG docker,www-data,input $USER
sudo usermod -aG docker,www-data,input root
# A system reboot or re-login is required for the group changes to take effect.
```


### PostgreSQL & pgAdmin
```bash
# Install pgAdmin Desktop
sudo apt install pgadmin4 -y

# Instructions for the web version if that was installed instead
echo "[!] If web version was installed, configure it with: sudo /usr/pgadmin4/bin/setup-web.sh"

# Note: To set a password for the default 'postgres' user:
# sudo -u postgres psql postgres
# alter user postgres with password 'your_password';
```


---

## 6. Desktop & System Customization

### Default Terminal Setup
Set the system's default terminal emulator. Run the command for your preferred terminal.
```bash
# For Terminator
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/terminator 60
sudo update-alternatives --config x-terminal-emulator

# For Warp (run after installing the .deb)
# sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/warpdotdev/warp-terminal/warp 60
# sudo update-alternatives --config x-terminal-emulator
```


### Custom Fonts
```bash
# Example: Copy custom fonts from a personal directory
mkdir ~/.local/share/fonts
cp -r ~/Dropbox/fonts ~/.local/share/fonts
# sudo cp -r ~/Dropbox/my-linux/fonts /usr/share/fonts/truetype/
sudo fc-cache -f -v
```

### System Tool Configuration
```bash
# Enable colorized output for GRC wrappers (e.g., ping, netstat)
sudo sed -i 's/^GRC_ALIASES.*/GRC_ALIASES=true/' /etc/default/grc

# Alias 'batcat' to 'bat' for easier access on Debian-based systems
mkdir -p $HOME/.local/bin && ln -s /usr/bin/batcat $HOME/.local/bin/bat
```


### GNOME Settings Tweaks
```bash
# Disable the emoji hotkey (Ctrl + .)
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"

# Set Alt+Tab to only show application icons, not window previews
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'

# To reset: gsettings reset org.gnome.shell.window-switcher app-icon-mode
```


## Specific Hardware

## Thinkpad T480s / L390

Optimize
```bash
# Swappiness not needed at 60 when I have 24GB ram
# Requires Reboot
sudo vim /etc/sysctl.conf
# Add
fs.inotify.max_user_watches=65536
vm.swappiness=10

# Enable TLP for Thinkpad Power Management, Meh..
sudo apt install tlp tlp-rdw
sudo tlp start
systemctl enable tlp.service

# Configure at
sudo vim /etc/default/tlp
```

```bash
#sudo apt install tlp powertop -y
```

### Logitech MX Master 3 Setup (logiops)
Advanced customization for Logitech devices. [Official Repo](https://github.com/PixlOne/logiops#readme).
```bash
# Install build dependencies
sudo apt install -y build-essential cmake pkg-config libevdev-dev libudev-dev libconfig++-dev libglib2.0-dev

# Clone, build, and install from source
git clone https://github.com/PixlOne/logiops.git ~/logiops
cd ~/logiops
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make && sudo make install
sudo systemctl enable --now logid

# Create the configuration file at /etc/logid.cfg
sudo tee /etc/logid.cfg > /dev/null <<'EOF'
devices: (
{
    name: "Logitech MX Master 3";
    smartshift:
    {
        on: true;
        threshold: 30;
        torque: 50;
    };
    hiresscroll:
    {
        hires: true;
        invert: false;
        target: false;
    };
    dpi: 4000;

    buttons: (
        {
            cid: 0xc3;
            action =
            {
                type: "Gestures";
                gestures: (
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action = { type: "Keypress"; keys: ["KEY_UP"]; };
                    },
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action = { type: "Keypress"; keys: ["KEY_DOWN"]; };
                    },
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action = { type: "CycleDPI"; dpis: [400, 600, 800, 1000, 1200, 1400, 1600]; };
                    },
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action = { type = "ToggleSmartshift"; }
                    },
                    {
                        direction: "None";
                        mode: "NoPress";
                    }
                );
            };
        },
        {
            cid: 0xc4;
            action = { type: "Keypress"; keys: ["KEY_A"]; };
        }
    );
}
);
EOF

# Restart the service to apply changes
sudo systemctl restart logid
```

---


&copy; 2025 Jesse Boyer &bull; [JREAM](https://jream.comv)

