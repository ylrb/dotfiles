-- Add nvim-cmp to default capabilities
local lsp_defaults = require('lspconfig').util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl})
end

vim.diagnostic.config {
    virtual_text = false,
    severity_sort = true,
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('', '<leader><tab>', vim.diagnostic.goto_prev, opts)
vim.keymap.set('', '<leader><s-tab>', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
On_attach = function(client, bufnr)
    -- Enable
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('', '<leader>D', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('', '<leader>d', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('', '<leader>i', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('', '<leader>I', vim.lsp.buf.signature_help, bufopts) -- default: <C-k>
    vim.keymap.set('', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('', '<leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('', '<leader>R', vim.lsp.buf.references, bufopts)
    vim.keymap.set('', '<leader>=', function() vim.lsp.buf.format { async = true } end, bufopts) -- default: <leader>f
end

Lsp_flags = {}

require('plugins.lsp.sumneko_lua')
require('plugins.lsp.clang')
require('plugins.lsp.pyright')
