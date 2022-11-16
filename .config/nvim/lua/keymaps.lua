-- Leader key
vim.g.mapleader = ' '

-- Disable some defaults
vim.keymap.set('n', '<leader>', '<nop>')

-- Exit & Save
vim.keymap.set('', '<c-s>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('', '<c-esc>', '<cmd>wq!<cr>', {desc = 'Exit'})

-- Copying & Deleting
vim.keymap.set('n', '<c-c>', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set('n', 'x', '"_x', {desc = 'Delete char without changing the register'})

-- Buffers 
vim.keymap.set('n', '<leader>w', ':Bdelete<cr>', {desc = 'Buffer delete'})
vim.keymap.set('n', '<leader>n', '<cmd>bnext<cr>', {desc = 'Move to next buffer'})
vim.keymap.set('n', '<leader>N', '<cmd>bprevious<cr>', {desc = 'Move to previous buffer'})

-- Windows
vim.keymap.set('n', '<leader>x', '<cmd>vs<cr>', {desc = 'Vertical split'})
vim.keymap.set('n', '<leader>X', '<cmd>sp<cr>', {desc = 'Horizontal split'})
vim.keymap.set('n', '<leader>q', '<cmd>wq!<cr>', {desc = 'Close window'})
vim.keymap.set('n', '<leader><right>', '<C-w><right>', {desc = 'Move right'})
vim.keymap.set('n', '<leader><down>', '<C-w><down>', {desc = 'Move down'})
vim.keymap.set('n', '<leader><left>', '<C-w><left>', {desc = 'Move left'})
vim.keymap.set('n', '<leader><up>', '<C-w><up>', {desc = 'Move up'})

-- Dashboard
vim.keymap.set('n', '<leader>,', ':Dashboard<cr>', {desc = 'Open Dashboard'})
