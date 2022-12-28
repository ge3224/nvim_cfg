vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.errorbells = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.opt.laststatus = 3
-- vim.opt.winbar = "%f"
-- vim.api.nvim_exec([[
--   highlight WinSeparator guibg=NONE
-- ]], false)
