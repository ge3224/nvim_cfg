local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local options = { noremap = true }

-- Set leader key
--map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

-- Edit init.lua
map('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', options)

-- Terminal escape
map('t', '<esc>', ':<C-\\><C-n>', options)

-- Source init.lua
map('n', '<leader>sv', ':luafile $MYVIMRC<CR>', options)

-- Telescope mappings
map('n', '<leader>ff', [[<Cmd>Telescope find_files<CR>]], options)
map('n', '<leader>fg', [[<Cmd>Telescope live_grep<CR>]], options)
map('n', '<leader>fh', [[<Cmd>Telescope buffers<CR>]], options)

-- harpoon
map('n', '<leader>H', [[:lua require("harpoon.mark").add_file()<CR>]], options)
map('n', '<leader>u', [[:lua require("harpoon.ui").nav_file(1)<CR>]], options)
map('n', '<leader>i', [[:lua require("harpoon.ui").nav_file(2)<CR>]], options)
map('n', '<leader>o', [[:lua require("harpoon.ui").nav_file(3)<CR>]], options)
map('n', '<leader>p', [[:lua require("harpoon.ui").nav_file(4)<CR>]], options)
map('n', '<leader>y', [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], options)


-- Moving through split windows
map('n', 'gj', [[<C-w>j]], options)
map('n', 'gh', [[<C-w>h]], options)
map('n', 'gk', [[<C-w>k]], options)
map('n', 'gl', [[<C-w>l]], options)

-- Remove duplicates
map('n', '<leader>rd', [[mz:g/^\(.*\)\n\1$/d<CR>'z]], options)

-- Remove extra whitespace
map('n', '<leader>ws', [[vip:s/\s\{2,}/ /g<CR>]], options)

-- Yank the full file path of the current buffer
map('n', '<leader>fp', [[:let @+ = expand("%:p")<CR>]], options)

