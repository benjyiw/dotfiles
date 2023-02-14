local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- adds goimports formatting when calling lsp format
        null_ls.builtins.formatting.goimports
    },
})
