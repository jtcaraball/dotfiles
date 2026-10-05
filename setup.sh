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
# - Work.
# - Others.
sudo pacman -S --needed wget stow rustup \
	hyprland hyprpaper hypridle wl-clipboard rofi waybar qt5-wayland qt6-wayland dunst libnotify xdg-desktop-portal-hyprland slurp grim\
	ttf-ibmplex-mono-nerd ttf-iosevka-nerd papirus-icon-theme noto-fonts-emoji \
	pipewire pipewire-jack pipewire-pulse pipewire-audio pipewire-alsa \
	zsh kitty yazi btop base-devel fzf fd \
	neovim ripgrep luarocks tree-sitter-cli \
	zathura zathura-pdf-mupdf mupdf mise uv typst \
	pass unzip

# Setup zsh, plugins and oh-my-posh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl -fsSL https://ohmyposh.dev/install.sh | bash -s
chsh -s /usr/bin/zsh
rm .zshrc || :

# Stow away
cd ~/.dotfiles
stow .
cd ~

# Logout message
echo "Setup done. Log out for all changes to take effect."
