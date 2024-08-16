# dotfiles

Personal configurations files.

## Neovim

### Important features

- LSP diagnostics and code completion with
  [lspconfig](https://github.com/neovim/nvim-lspconfig),
  [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and
  [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
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
- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim).

### Not so important features

- Faster code editing with
  [vim-commentary](https://github.com/tpope/vim-commentary),
  [quick-scope](https://github.com/unblevable/quick-scope),
  [nvim-surround](https://github.com/kylechui/nvim-surround) and
  [treesj](https://github.com/Wansmer/treesj).
- Nice icons with
  [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) (and
  other [Nerd Fonts](https://www.nerdfonts.com/) supported icons).
- Minimal but informative status line with
  [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- A pretty yet useless greeter with
  [alpha-vim](https://github.com/goolord/alpha-nvim).
- [Catppuccin](https://github.com/catppuccin/nvim).

## Notes

- Neovim's theme is intended to be used together with the
  [kitty](https://sw.kovidgoyal.net/kitty/) configuration in this repository
  and the SauceCodePro Nerd Font which can be downloaded
  [here](https://www.nerdfonts.com/font-downloads).

- The mappings were choosen (or left as is) to suit a
  [Ferris Sweep](https://github.com/davidphilipbarr/Sweep) using
  [these](https://github.com/jtcaraball/qmk_firmware/blob/my-branch/keyboards/ferris/sweep/keymaps/mine/keymap.c)
  mappings but they should work fine on any keyboard.

## Installation

Ensure that:

1. [kitty](https://sw.kovidgoyal.net/kitty/),
   [oh_my_zsh](https://github.com/ohmyzsh/ohmyzsh),
   [neovim](https://github.com/neovim/neovim) and
   [stow](https://www.gnu.org/software/stow/manual/stow.html) are installed in
   your system.
2. The following dot files or directories are not present in your home
   directory: `.zshrc`, `.p10k.zsh`, `.config/nvim` or `.config/kitty`.

Then run the following commands

```bash
cd $HOME
git clone https://github.com/jtcaraball/dotfiles
cd dotfiles
stow .
```
