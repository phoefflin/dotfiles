-- global settings for native neovim and VSCode Neovim
vim.cmd("set mouse=")
vim.cmd('set fixendofline')
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>")
-- vim.keymap.set("i", "jj", "<ESC>", { silent = true })

if vim.g.vscode then
  -- disable everything for vscode
  print("running in VSCode")
else
  print("NOT running in VSCode")
  
  -- Create a group for autocmds
  vim.api.nvim_create_augroup("EnsureTrailingNewline", { clear = true })
  
  -- Autocmd to ensure trailing newline
  vim.api.nvim_create_autocmd("BufWritePre", {
      group = "EnsureTrailingNewline",
      callback = function()
  	local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, true)[1]
  	if last_line ~= "" then
  	    vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
  	end
      end,
  })
end

