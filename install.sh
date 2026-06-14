#!/bin/sh
set -e

bold="\033[1m"
reset="\033[0m"

echo "${bold}Enabling repositories..."
sudo xbps-install -Sy \
    void-repo-nonfree \
    void-repo-multilib \
    void-repo-multilib-nonfree \
    linux-firmware \
    base-devel

echo "${bold}Updating system..."
sudo xbps-install -Su

echo "${bold}Installing desktop, Wayland and Niri..."
sudo xbps-install -y \
    niri \
    foot \
    fuzzel \
    Waybar \
    mako \
    xdg-desktop-portal \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-gnome \
    wl-clipboard \
    brightnessctl \
    playerctl \
    pipewire \
    wireplumber \
    pavucontrol \
    seatd \
    turnstile \
    dbus

echo "${bold}Enabling base services..."
sudo ln -sf /etc/sv/seatd /var/service
sudo ln -sf /etc/sv/turnstiled /var/service
sudo ln -sf /etc/sv/dbus /var/service

echo "${bold}Installing graphics and gaming packages..."
sudo xbps-install -y \
    mesa-dri \
    mesa-vaapi \
    vulkan-loader \
    mesa-vulkan-radeon \
    mesa-dri-32bit \
    mesa-vaapi-32bit \
    vulkan-loader-32bit \
    mesa-vulkan-radeon-32bit \
    gamemode \
    gamescope \
    steam

echo "${bold}Installing development tools..."
sudo xbps-install -y \
    git \
    gcc \
    clang \
    make \
    cmake \
    ninja \
    pkg-config \
    gdb \
    valgrind \
    rust \
    cargo \
    go \
    python3 \
    python3-pip \
    neovim \
    curl \
    wget \
    unzip \
    zip

echo "${bold}Installing useful utilities..."
sudo xbps-install -y \
    fastfetch \
    htop \
    btop \
    ripgrep \
    tree \
    rsync

echo "${bold}Adding user to correct groups..."
sudo usermod -aG video,input,audio,_seatd "$USER"

echo "${bold}Installing personal dotfiles..."
cd ~
mkdir -p .config

rsync -a dotfiles/config/ .config/
rsync -a dotfiles/wallpapers/ wallpapers/

echo "${bold}Preparing to install Zen${reset}"
echo "Cloning void-packages..."
git clone https://github.com/void-linux/void-packages.git ~/void-packages
cd ~/void-packages

echo "${bold}Bootstrapping build environment..."
./xbps-src binary-bootstrap

echo "${bold}Adding Zen..."
git clone https://github.com/salastro/zen-browser.git ~/zen-browser
mkdir -p srcpkgs/zen-browser
cp -r ~/zen-browser/* srcpkgs/zen-browser/

echo "${bold}Installing Zen..."
./xbps-src pkg zen-browser
sudo xbps-install --repository=hostdir/binpkgs zen-browser
cd ~

echo "${bold}Preparing to install Ly${reset}"
echo "${bold}Getting latest zig binary..."
wget https://ziglang.org/download/0.16.0/zig-x86_64-linux-0.16.0.tar.xz
tar -xv zig-x86_64-linux-0.16.0.tar.xz

echo "${bold}Installing Ly..."
git clone https://codeberg.org/fairyglade/ly.git
cd ly
zig build
zig build installexe -Dinit_system=runit

echo "${bold}Enabling Ly..."
ln -s /etc/sv/ly /var/service/
rm /var/service/agetty-tty2

echo "${bold}Cleaning up..."
cd ~
rm -rf zen-browser
rm -rf zig-x86_64-linux-0.16.0.tar.xz

echo "${bold}Done."
