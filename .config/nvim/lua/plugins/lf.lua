vim.g.lf_replace_netrw = 1
vim.g.lf_width = 0.9
vim.g.lf_height = 0.9
vim.g.lf_map_keys = 0
vim.g.lf_command_override = 'lf -command "set hidden"'
vim.g.floaterm_title = ' lf '

vim.keymap.set('n', '<C-l>', '<cmd>Lf<cr>', {desc = 'Open lf'})
vim.keymap.set('n', '<leader>l', '<cmd>Lf<cr>', {desc = 'Open lf'})

-- Same style as Telescope
vim.cmd(':highlight link Floaterm Normal')
vim.cmd(':highlight link FloatermBorder Normal')
