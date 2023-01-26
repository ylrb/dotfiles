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
vim.keymap.set('n', '<leader>w', '<Cmd>BufferClose<cr>', {desc = 'Buffer delete'})
vim.keymap.set('n', '<leader>n', '<Cmd>BufferNext<cr>', {desc = 'Move to previous buffer'})
vim.keymap.set('n', '<leader>N', '<Cmd>BufferPrevious<cr>', {desc = 'Move to next buffer'})
vim.keymap.set('n', '<leader>&', '<Cmd>BufferGoto 1<CR>', {desc = 'Move to buffer 1'})
vim.keymap.set('n', '<leader>é', '<Cmd>BufferGoto 2<CR>', {desc = 'Move to buffer 2'})
vim.keymap.set('n', '<leader>"', '<Cmd>BufferGoto 3<CR>', {desc = 'Move to buffer 3'})
vim.keymap.set('n', "<leader>'", '<Cmd>BufferGoto 4<CR>', {desc = 'Move to buffer 4'})
vim.keymap.set('n', '<leader>(', '<Cmd>BufferGoto 5<CR>', {desc = 'Move to buffer 5'})
vim.keymap.set('n', '<leader>-', '<Cmd>BufferGoto 6<CR>', {desc = 'Move to buffer 6'})
vim.keymap.set('n', '<leader>è', '<Cmd>BufferGoto 7<CR>', {desc = 'Move to buffer 7'})
vim.keymap.set('n', '<leader>è', '<Cmd>BufferGoto 8<CR>', {desc = 'Move to buffer 8'})
vim.keymap.set('n', '<leader>ç', '<Cmd>BufferGoto 9<CR>', {desc = 'Move to buffer 9'})
vim.keymap.set('n', '<leader>à', '<Cmd>BufferLast<CR>', {desc = 'Move to last buffer'})

-- Windows
vim.keymap.set('n', '<leader>x', '<cmd>vs<cr>', {desc = 'Vertical split'})
vim.keymap.set('n', '<leader>X', '<cmd>sp<cr>', {desc = 'Horizontal split'})
vim.keymap.set('n', '<leader>q', '<cmd>wq!<cr>', {desc = 'Close window'})
vim.keymap.set('n', '<leader><right>', '<C-w><right>', {desc = 'Move right'})
vim.keymap.set('n', '<leader><down>', '<C-w><down>', {desc = 'Move down'})
vim.keymap.set('n', '<leader><left>', '<C-w><left>', {desc = 'Move left'})
vim.keymap.set('n', '<leader><up>', '<C-w><up>', {desc = 'Move up'})

-- Other
vim.keymap.set('n', '<leader>,', ':Dashboard<cr>', {desc = 'Open dashboard'})
vim.keymap.set('n', '<C-Up>', '3k', {desc = 'Jump up'})
vim.keymap.set('n', '<C-Down>', '3j', {desc = 'Jump down'})

-- Azerty Numbers
vim.keymap.set('n', '&', '1',  {desc = '1'})
vim.keymap.set('n', 'é', '2',  {desc = '2'})
vim.keymap.set('n', '"', '3',  {desc = '3'})
vim.keymap.set('n','\'', '4',  {desc = '4'})
vim.keymap.set('n', '(', '5',  {desc = '5'})
vim.keymap.set('n', '-', '6',  {desc = '6'})
vim.keymap.set('n', 'è', '7',  {desc = '7'})
vim.keymap.set('n', '_', '8',  {desc = '8'})
vim.keymap.set('n', 'ç', '9',  {desc = '9'})
vim.keymap.set('n', 'à', '0',  {desc = '0'})
