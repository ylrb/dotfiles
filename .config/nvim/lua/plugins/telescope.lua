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

vim.keymap.set('', '<leader>f', builtin.find_files)
vim.keymap.set('', '<leader>b', builtin.buffers)
vim.keymap.set('', '<leader>v', builtin.lsp_document_symbols)
vim.keymap.set('', '<leader>h', builtin.oldfiles)
vim.keymap.set('', '<leader>g', builtin.live_grep)
vim.keymap.set('', '<leader>e', builtin.diagnostics)
vim.keymap.set('', '<leader>H', builtin.help_tags)
vim.keymap.set('', '<leader>s', builtin.current_buffer_fuzzy_find)
-- vim.keymap.set('', '<leader>fs', require('session-lens').search_session)
vim.keymap.set('', '<leader>p', builtin.registers)
vim.keymap.set('', '<leader>r', builtin.lsp_references)
vim.keymap.set('', '<leader>i', builtin.lsp_implementations)
vim.keymap.set('', '<leader>t', builtin.builtin)

-- require('telescope').load_extension('session-lens')
