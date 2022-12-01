require('telescope').setup {
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        mappings = {
            n = {
                ['q'] = require('telescope.actions').close,
            },
        },
    },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {desc = 'Telescope files'})
vim.keymap.set('n', '<leader>b', builtin.buffers, {desc = 'Telescope buffers'})
vim.keymap.set('n', '<leader>v', builtin.lsp_document_symbols, {desc = 'Telescope variables'})
vim.keymap.set('n', '<leader>h', builtin.oldfiles, {desc = 'Telescope history'})
vim.keymap.set('n', '<leader>G', builtin.live_grep, {desc = 'Telescope livegrep'})
vim.keymap.set('n', '<leader>E', builtin.diagnostics, {desc = 'Telescope errors'})
vim.keymap.set('n', '<leader>H', builtin.help_tags, {desc = 'Telescope tags'})
vim.keymap.set('n', '<leader>s', builtin.current_buffer_fuzzy_find, {desc = 'Telescope search'})
-- vim.keymap.set('n', '<leader>fs', require('session-lens').search_session, {desc = 'Telescope sessions'})
vim.keymap.set('n', '<leader>p', builtin.registers, {desc = 'Telescope clipboard'})
vim.keymap.set('n', '<leader>r', builtin.lsp_references, {desc = 'Telescope lsp_references'})
vim.keymap.set('n', '<leader>K', builtin.lsp_implementations, {desc = 'Telescope implementations'})
vim.keymap.set('n', '<leader>o', builtin.builtin, {desc = 'Telescope builtin'})

-- require('telescope').load_extension('session-lens')
