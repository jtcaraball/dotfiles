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
sudo pacman -S --needed wget stow \
	xorg i3-wm feh picom polybar rofi maim xdotool xclip dunst libnotify \
	ttf-ibmplex-mono-nerd ttf-iosevka-nerd epapirus-icon-theme noto-font-emoji \
	pipewire pipewire-jack pipewire-pulse pipewire-audio pipewire-alsa \
	kitty yazi btop rustup base-devel fzf fd \
	neovim ripgrep luarocks fd

# Setup Xorg
Xorg :0 -configure > /dev/null 2>&1
sudo mv $HOME/xorg.conf.new /etc/X11/xorg.conf

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
rm .zshrc

# Set keyboard locale
sudo localectl --no-convert set-x11-keymap us,us "" ,alt-intl grp:alt_shift_toggle

# Stow away
cd ~/.dotfiles
stow .
cd ~

# Logout message
echo "Setup done. Log out for all changes to take effect."
