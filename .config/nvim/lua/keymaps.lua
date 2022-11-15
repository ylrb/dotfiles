-- Leader key
vim.g.mapleader = ' '

-- Disable some defaults
vim.keymap.set('', '<leader>', '<nop>')

-- Exit & Save
vim.keymap.set('', '<c-s>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('', '<c-esc>', '<cmd>wq!<cr>', {desc = 'Exit'})

-- Copying & Deleting
vim.keymap.set('', '<c-c>', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set('', 'x', '"_x', {desc = 'Delete char without changing the register'})

-- Buffers 
vim.keymap.set('', '<leader>w', ':Bdelete<cr>', {desc = 'Buffer delete'})
vim.keymap.set('', '<leader>n', '<cmd>bnext<cr>', {desc = 'Move to next buffer'})
vim.keymap.set('', '<leader>N', '<cmd>bprevious<cr>', {desc = 'Move to previous buffer'})

-- Windows
vim.keymap.set('', '<leader>x', '<cmd>vs<cr>', {desc = 'Vertical split'})
vim.keymap.set('', '<leader>X', '<cmd>sp<cr>', {desc = 'Horizontal split'})
vim.keymap.set('', '<leader>q', '<cmd>wq!<cr>', {desc = 'Close window'})
vim.keymap.set('', '<leader><right>', '<C-w><right>', {desc = 'Move right'})
vim.keymap.set('', '<leader><down>', '<C-w><down>', {desc = 'Move down'})
vim.keymap.set('', '<leader><left>', '<C-w><left>', {desc = 'Move left'})
vim.keymap.set('', '<leader><up>', '<C-w><up>', {desc = 'Move up'})
