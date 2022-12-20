-- Add nvim-cmp to default capabilities
local lsp_defaults = require('lspconfig').util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

local signs = { Error = "✖ ", Warn = "▲ ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config {
	virtual_text = false,
	severity_sort = true,
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {desc = 'See error'})
vim.keymap.set('n', '<leader><tab>', vim.diagnostic.goto_prev, { desc = 'Previous error' })
vim.keymap.set('n', '<leader><s-tab>', vim.diagnostic.goto_next, { desc = 'Next error' })
vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, { desc = 'See declaration' })
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { desc = 'See definition' })
vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, { desc = 'See information' })
vim.keymap.set('n', '<leader>I', vim.lsp.buf.signature_help, { desc = 'See signature' }) -- default: <C-k>
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'See type definition' })
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>R', vim.lsp.buf.references, { desc = 'See references' })
vim.keymap.set('n', '<leader>=', function() vim.lsp.buf.format { async = true } end, { desc = 'Format file' }) -- default: <leader>f

Lsp_flags = {}

require('plugins.lsp.sumneko_lua')
require('plugins.lsp.clang')
require('plugins.lsp.pyright')
require('plugins.lsp.tsserver')
require('plugins.lsp.gopls')
