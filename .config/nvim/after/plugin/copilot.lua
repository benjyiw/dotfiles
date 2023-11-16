vim.keymap.set('n', '<leader>cpe', '<cmd>Copilot enable<cr>')
vim.keymap.set('n', '<leader>cpd', '<cmd>Copilot disable<cr>')
vim.keymap.set('n', '<leader>cps', '<cmd>Copilot status<cr>')
vim.keymap.set('n', '<leader>cpp', '<cmd>Copilot panel<cr>')
vim.keymap.set('i', '<c-\\>', '<Plug>(copilot-suggest)')

vim.g.copilot_filetypes = {
    ["vimwiki"] = false,
    ["text"] = false,
}
