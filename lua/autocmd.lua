local ft_markdown = vim.api.nvim_create_augroup("Markdown", { clear = true })

vim.api.nvim_create_autocmd("FileType", { 
  pattern = "markdown", 
  command = "setlocal spell",
  group = ft_markdown
})

vim.api.nvim_create_autocmd("FileType", { 
  pattern = "markdown", 
  command = "setlocal wrap",
  group = ft_markdown
})

vim.api.nvim_create_autocmd("FileType", { 
  pattern = "markdown", 
  command = "setlocal linebreak",
  group = ft_markdown
})
