return {
  'stevearc/aerial.nvim',
  opts = {},
  keys = {
    {
      "<leader>to",
      "<cmd>AerialToggle!<CR>",
      desc = "Toggle Code Outline",
    }
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
}
