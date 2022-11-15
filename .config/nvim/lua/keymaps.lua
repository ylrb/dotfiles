vim.keymap.set('n', '<c-s>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<c-esc>', '<cmd>wq<cr>', {desc = 'Exit'})
vim.keymap.set({'n', 'x'}, '<c-c>', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'x', '"_x', {desc = 'Delete char without changing the register'})
