--require('copilot').config(function()
    -- vim.b.copilot_enabled=false
--end)

vim.b["copilot_enabled"]=vim.v["false"] -- this doesn't seem to work

-- i couldn't get these to work properly i think should try later
-- vim.keymap.set('n', '<leader>cp', '<cmd>lua require("copilot").toggle()<cr>')
-- vim.keymap.set('i', '<c-\\>', '<cmd>lua require("copilot").suggest()<cr>')
-- vim.keymap.set('n', '<leader>cp', '<Plug>(copilot-toggle)')
-- vim.keymap.set('i', '<c-\\>', '<Plug>(copilot-suggest)')

vim.keymap.set('n', '<leader>cpe', '<cmd>Copilot enable<cr>')
vim.keymap.set('n', '<leader>cpd', '<cmd>Copilot disable<cr>')
vim.keymap.set('n', '<leader>cps', '<cmd>Copilot status<cr>')
vim.keymap.set('n', '<leader>cpp', '<cmd>Copilot panel<cr>')
vim.keymap.set('i', '<c-\\>', '<cmd>lua require("copilot").suggest()<cr>')

vim.g.copilot_filetypes = {
    ["vimwiki"] = false,
}
