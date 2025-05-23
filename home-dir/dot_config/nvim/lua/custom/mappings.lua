-- <leader>e to open netrw file explorer
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = 'Open file explorer (netrw)' })

-- <leader>b to go to the previous buffer
vim.keymap.set('n', '<leader>b', '<C-^>', { desc = 'Go to previous buffer' })
