vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("dap-go").setup()
vim.keymap.set("n", "<leader>td", "<Cmd>lua require('dap-go').debug_test()<CR>")



