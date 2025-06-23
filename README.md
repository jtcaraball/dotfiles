# dotfiles

My personal configuration for my arch machine. It includes a setup script
for installing and setting up all packages.

![sample screenshot](screenshot.png)

## System & applications

- Display manager: [hyprland](https://wiki.archlinux.org/title/Hyprland).
- Terminal emulator: [kitty](https://wiki.archlinux.org/title/Kitty).
- Application and utilities launcher: [rofi](https://wiki.archlinux.org/title/Rofi).
- Notifications: [dunst](https://wiki.archlinux.org/title/Dunst).
- Status bar: [waybar](https://wiki.archlinux.org/title/Waybar).
- File manager: [yazi](https://github.com/sxyazi/yazi).
- Audio recording and playback: [pipewire](https://wiki.archlinux.org/title/PipeWire).
- Others: [fzf](https://wiki.archlinux.org/title/Fzf),
          [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) and
          [btop](https://github.com/aristocratos/btop).

## Neovim

### Important features

- Native LSP diagnostics and code completion with
  [blink.nvim](https://github.com/Saghen/blink.nvim).
- Linting and code formatting with
  [nvim-lint](https://github.com/mfussenegger/nvim-lint) and
  [conform](https://github.com/stevearc/conform.nvim).
- Dependency management with
  [mason.nvim](https://github.com/williamboman/mason.nvim).
- Git integration with [vim-fugitive](https://github.com/tpope/vim-fugitive).
- Syntax highlighting with
  [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- Fuzzy browsing with
  [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Fast file traversing with [harpoon v2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2).
- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim).
- Faster code editing with
  [vim-commentary](https://github.com/tpope/vim-commentary),
  [quick-scope](https://github.com/unblevable/quick-scope),
  [nvim-surround](https://github.com/kylechui/nvim-surround) and
  [treesj](https://github.com/Wansmer/treesj).

### Not so important features

- Nice icons with
  [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) (and
  other [Nerd Fonts](https://www.nerdfonts.com/) supported icons).
- Minimal but informative status line with
  [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- A pretty yet useless greeter with
  [alpha-vim](https://github.com/goolord/alpha-nvim).
- [Catppuccin](https://github.com/catppuccin/nvim).

## Notes

- In order for the `poweroff`, `reboot` and `logout` commands in the rofi
  launcher to work you must first set up the necessary permissions, for
  example, with `polkit`.

- Neovim's theme is intended to be used together with the
  [kitty](https://sw.kovidgoyal.net/kitty/) configuration in this repository.

- The mappings were chosen (or left as is) to suit a
  [Ferris Sweep](https://github.com/davidphilipbarr/Sweep) or a [Skeletyl](https://github.com/Bastardkb/Skeletyl) using
  [these](https://github.com/jtcaraball/qmk_firmware/blob/my-branch/keyboards/ferris/sweep/keymaps/mine/keymap.c) or
  [these](https://github.com/jtcaraball/qmk_firmware/blob/my-branch/keyboards/bastardkb/skeletyl/keymaps/mine/keymap.c)
  mappings respectively, but they should work fine on any keyboard.

## Installation

Ensure that `git` is installed and run the following commands.

```bash
cd $HOME
git clone --branch arch https://github.com/jtcaraball/dotfiles .dotfiles
bash .dotfiles/setup.sh
```
