local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local options = { noremap = true }

-- Set leader key
--map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

-- Edit init.lua
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', options)

-- Terminal escape
vim.keymap.set('t', '<esc>', ':<C-\\><C-n>', options)

-- Source init.lua
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', options)

-- Telescope mappings
vim.keymap.set("n", "<leader>ff", [[<Cmd>Telescope find_files<CR>]], options)
vim.keymap.set("n", "<leader>fg", [[<Cmd>Telescope live_grep<CR>]], options)
vim.keymap.set("n", "<leader>fh", [[<Cmd>Telescope buffers<CR>]], options)
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", options)

-- harpoon
vim.keymap.set('n', '<leader>H', [[:lua require("harpoon.mark").add_file()<CR>]], options)
vim.keymap.set('n', '<leader>u', [[:lua require("harpoon.ui").nav_file(1)<CR>]], options)
vim.keymap.set('n', '<leader>i', [[:lua require("harpoon.ui").nav_file(2)<CR>]], options)
vim.keymap.set('n', '<leader>o', [[:lua require("harpoon.ui").nav_file(3)<CR>]], options)
vim.keymap.set('n', '<leader>p', [[:lua require("harpoon.ui").nav_file(4)<CR>]], options)
vim.keymap.set('n', '<leader>y', [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], options)


-- Moving through split windows
vim.keymap.set('n', 'gj', [[<C-w>j]], options)
vim.keymap.set('n', 'gh', [[<C-w>h]], options)
vim.keymap.set('n', 'gk', [[<C-w>k]], options)
vim.keymap.set('n', 'gl', [[<C-w>l]], options)

-- Remove all ^M carriage returns from a buffer
vim.keymap.set('n', '<leader>fu', [[:e ++fileformat=dos<CR> :set fileformat=unix<CR>]], options);

-- Remove duplicates
vim.keymap.set('n', '<leader>rd', [[mz:g/^\(.*\)\n\1$/d<CR>'z]], options)

-- Remove extra whitespace
vim.keymap.set('n', '<leader>ws', [[vip:s/\s\{2,}/ /g<CR>]], options)

-- Yank the full file path of the current buffer
vim.keymap.set('n', '<leader>fp', [[:let @+ = expand("%:p")<CR>]], options)

-- Extend css utility classes
vim.keymap.set('n', '<leader>bs', [[:s/^\s\{0,}/\t@extend ./:s/\(\w\)\s\(\w\)/\1, .\2/g:s/\(\w\)\s\{0,}$/\1;]], options)

-- Open calendar in split view
vim.keymap.set("n", "<leader>cv", "<cmd>Calendar -view=year -split=vertical -width=27<CR>", options)

-- Open quickfix list
vim.keymap.set("n", "<leader>qf", "<cmd>copen<CR><c-w>J", options);
vim.keymap.set("n", "<leader>qfc", "<cmd>cclose<CR>", options);
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", options)
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", options)

-- fugitive
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //2<CR>", options);
vim.keymap.set("n", "<leader>gr", "<cmd>diffget //3<CR>", options);


-- source mappings.lua
local srcmd = "nvim/lua/mappings.lua<CR>"
local os = vim.loop.os_uname().sysname

if os == "Linux" then
  srcmd = "<cmd>luafile ~/.config/" .. srcmd
elseif os == "Windows_NT" then
  srcmd = "<cmd>luafile $LOCALAPPDATA/" .. srcmd
end

vim.keymap.set("n", "<leader>sm", srcmd)
