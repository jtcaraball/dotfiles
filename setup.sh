#!/usr/bin/env bash

# Download packages
sudo pacman -Syu
# In order:
# - Dependencies needed to run setup.
# - Window manager++.
# - Fonts, symbols and emoji.
# - Audio.
# - Terminal.
# - Neovim.
sudo pacman -S --needed wget stow rustup \
	hyprland hyprpaper hypridle wl-clipboard rofi-wayland qt5-wayland qt6-wayland dunst libnotify xdg-desktop-portal-hyprland \
	ttf-ibmplex-mono-nerd ttf-iosevka-nerd papirus-icon-theme noto-fonts-emoji \
	pipewire pipewire-jack pipewire-pulse pipewire-audio pipewire-alsa \
	kitty yazi btop base-devel fzf fd \
	neovim ripgrep luarocks

# Install paru and oh-my-posh
rustup default stable
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~
paru -S oh-my-posh

# Setup zsh and plugins
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s /usr/bin/zsh
rm .zshrc || :

# Stow away
cd ~/.dotfiles
stow .
cd ~

# Logout message
echo "Setup done. Log out for all changes to take effect."
