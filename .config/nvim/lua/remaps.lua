--
local opts = { remap = false }

-- set leader
vim.g.mapleader = " "

-- copy to global clipboard with Y
vim.keymap.set("v", "Y", "\"+y")

-- autoformat
vim.keymap.set("n", "<space>af", function() vim.lsp.buf.format { async = true } end, opts)

-- search replace current highlighted word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
