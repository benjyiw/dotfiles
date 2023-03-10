require("nvim-tree").setup({
    renderer = {
        icons = {
            show = {
                -- file = false,
                -- folder = false,
                -- TODO arrow folder doesn't work for some reason
                folder_arrow = false,
                -- git = false
            }
        }
    },
    update_focused_file = {
        enable = true,
    },
    tab = {
        sync = {
            open = true,
            close = true,
        }
    },
})
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
