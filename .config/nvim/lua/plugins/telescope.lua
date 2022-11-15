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

vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>v', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>h', builtin.oldfiles)
vim.keymap.set('n', '<leader>c', function() return builtin.find_files { cwd = '~/.config/' } end)
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>e', builtin.diagnostics)
vim.keymap.set('n', '<leader>H', builtin.help_tags)
vim.keymap.set('n', '<leader>s', builtin.current_buffer_fuzzy_find)
-- vim.keymap.set('n', '<leader>fs', require('session-lens').search_session)
vim.keymap.set('n', '<leader>p', builtin.registers)
vim.keymap.set('n', '<leader>r', builtin.lsp_references)
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>t', builtin.builtin)

-- require('telescope').load_extension('session-lens')
