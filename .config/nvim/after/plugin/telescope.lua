local builtin = require('telescope.builtin')

local opts = { remap = false }
vim.keymap.set('n', '<leader><leader>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fi', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts)
