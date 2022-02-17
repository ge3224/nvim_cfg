local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options

o.backup = false
o.cmdheight = 2
o.errorbells = false
o.hidden = true
o.hlsearch = false
o.ignorecase = true
o.isfname = o.isfname .. ",:"
o.scrolloff = 12
o.showmode = false
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.undofile = true
o.updatetime = 50

-- window-local options

--wo.colorcolumn = "80"
wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.wrap = false

-- buffer-local options

bo.fileformat = "unix"
bo.spellfile = "spell/en.utf-8.add"
bo.spelllang = "en,cjk"
bo.swapfile = false
-- bo.formatoptions="cro"

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.g['airline#extensions#tabline#formatter'] = 'default'
vim.g.airline_section_z = '%p%%%{g:airline_symbols.linenr}%#__accent_bold#%l/%L'
