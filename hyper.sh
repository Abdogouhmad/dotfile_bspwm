#!/bin/bash

set -e

# Define colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Install yay if not already installed
if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}Installing yay...${NC}"
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    echo -e "${GREEN}yay installed successfully.${NC}"
else
    echo -e "${GREEN}yay is already installed.${NC}"
fi

# Install Bun
echo -e "${YELLOW}Installing Bun...${NC}"
curl -fsSL https://bun.sh/install | bash
sudo ln -s $HOME/.bun/bin/bun /usr/local/bin/bun
echo -e "${GREEN}Bun installed successfully.${NC}"

# List of packages to install with pacman (system packages)
system_packages=(
  helix
  pipewire
  libgtop
  bluez
  bluez-utils
  btop
  networkmanager
  dart-sass
  wl-clipboard
  brightnessctl
  swww
  python
  gnome-bluetooth-3.0
  pacman-contrib
  power-profiles-daemon
)

echo -e "${YELLOW}Checking and installing system packages...${NC}"
for package in "${system_packages[@]}"; do
    if ! pacman -Qi $package &>/dev/null; then
        echo -e "${YELLOW}Installing $package...${NC}"
        sudo pacman -S --needed $package
        echo -e "${GREEN}$package installed.${NC}"
    else
        echo -e "${GREEN}$package is already installed.${NC}"
    fi
done

# List of AUR packages to install with yay
aur_packages=(
  grimblast-git
  gpu-screen-recorder
  hyprpicker
  matugen-bin
  python-gpustat
  aylurs-gtk-shell-git
)

echo -e "${YELLOW}Checking and installing AUR packages...${NC}"
for package in "${aur_packages[@]}"; do
    if ! yay -Q $package &>/dev/null; then
        echo -e "${YELLOW}Installing $package...${NC}"
        yay -S --needed $package
        echo -e "${GREEN}$package installed.${NC}"
    else
        echo -e "${GREEN}$package is already installed.${NC}"
    fi
done

# Clone and set up HyprPanel
echo -e "${YELLOW}Cloning and setting up HyprPanel...${NC}"
git clone https://github.com/Jas-SinghFSU/HyprPanel.git
ln -s $(pwd)/HyprPanel $HOME/.config/ags
echo -e "${GREEN}HyprPanel setup complete.${NC}"

# Install JetBrainsMono NerdFonts for icons
echo -e "${YELLOW}Installing JetBrainsMono NerdFonts...${NC}"
./HyprPanel/install_fonts.sh
echo -e "${GREEN}JetBrainsMono NerdFonts installed.${NC}"

echo -e "${GREEN}HypePanel setup complete! Restart your system for all changes to take effect.${NC}"
