-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- TODO a bunch of this is from the primeagen and i need to figure out what i actually want from all of this

lsp.ensure_installed({
    'gopls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
})
-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    -- disable diagnostics for helm files
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
        vim.diagnostic.disable(bufnr)
        vim.defer_fn(function()
            vim.diagnostic.reset(nil, bufnr)
        end, 1000)
    end

end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- hacky workaround for omnisharp not supporting semantic tokens
-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1534044732
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Fix startup error by disabling semantic tokens for omnisharp",
  group = vim.api.nvim_create_augroup("OmnisharpHook", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client.name == "omnisharp" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.api.nvim_create_user_command('ListFormatters', function()
  local clients = vim.lsp.get_active_clients({bufnr = vim.api.nvim_get_current_buf()})

  local formatters = vim.tbl_filter(function(c)
    return c.supports_method('textDocument/formatting')
  end, clients)

  formatters = vim.tbl_map(function(c) return c.name end, formatters)

  if #formatters > 0 then
    print(vim.inspect(formatters))
  else
    print('No formatters active in current buffer')
  end
end, {})
