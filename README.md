# Neovim Configuration

This repository contains my personal Neovim configuration, aimed at enhancing
my coding experience and productivity. It includes various plugins, key
mappings, and settings to tailor Neovim to my preferences.

## Installation

1. Make sure you have Neovim installed on your system.
2. Clone this repository to your preferred location:

   ```bash
   git clone https://github.com/ge3224/nvim_cfg.git ~/.config/nvim
   ```

3. Open Neovim:

   ```bash
   nvim
   ```

## Features

- `<Space>` is set as the leader key.
- Plugin management using [lazy.nvim](https://github.com/folke/lazy.nvim).
- Neovim plugins for various functionality, including Git integration, LSP (Language Server Protocol) support, fuzzy file finding, autocompletion, code formatting, and more.
- Custom key mappings to enhance the default Neovim experience.
- Syntax highlighting and indentation configuration using [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

## Key Mappings

The configuration includes various key mappings to streamline common tasks. Some notable key mappings include:

- `<Space>` as a leader key for custom mappings.
- `<leader>ev`: Edit the `init.lua` configuration file.
- `<leader>P`: Run [Prettier](https://prettier.io/) on the current file.
- `<leader>st`: Open a small terminal.
- `<leader>gs`: Run Git commands using [fugitive.vim](https://github.com/tpope/vim-fugitive).
- `<leader>?`: Search for recently opened files using [Telescope](https://github.com/nvim-telescope/telescope.nvim).
- `<leader><space>`: Find existing buffers using Telescope.
- `<leader>/`: Fuzzily search in the current buffer using Telescope.
- Many other custom mappings for navigating, editing, and searching.

Please refer to the [init.lua](init.lua) file for a comprehensive list of key mappings and their descriptions.

## Plugins

This configuration includes several plugins to enhance Neovim functionality. The plugins are managed using [lazy.nvim](https://github.com/folke/lazy.nvim) for streamlined installation and configuration.

Some of the notable plugins included are:

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Autocompletion framework.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Configuration for various LSP servers.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git signs and utilities.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder and file picker.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and indentation.
- [luasnip](https://github.com/L3MON4D3/LuaSnip): Snippet engine.

For a complete list of plugins and their configurations, please refer to the [init.lua](init.lua) file.

## Contributing

If you have any suggestions, improvements, or bug fixes for this Neovim configuration, feel free to open an issue or pull request on the [GitHub repository](https://github.com/ge3224/nvim_cfg).

## License

This project is licensed under the [MIT License](LICENSE).
