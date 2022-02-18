return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use 'nvim-lua/plenary.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'onsails/lspkind-nvim'
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'
  use 'L3MON4D3/LuaSnip'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'

  use 'terrortylor/nvim-comment'

  use 'ThePrimeagen/harpoon'

  use 'tpope/vim-vinegar'

  use 'tpope/vim-fugitive'

  use 'tpope/vim-surround'

  use 'tpope/vim-eunuch'

  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'

  use 'itchyny/calendar.vim'
  use 'freitass/todo.txt-vim'
  use 'rhysd/vim-grammarous'
  use 'KabbAmine/lazyList.vim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
end)
