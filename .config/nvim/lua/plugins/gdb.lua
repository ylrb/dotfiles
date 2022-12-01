vim.g.nvimgdb_use_find_executables = 0
vim.g.nvimgdb_use_cmake_to_find_executables = 0

vim.keymap.set('', '<leader>dd', '')
vim.keymap.set('n', '<leader>g', ':GdbStart gdb -q<cr>', {desc = 'Open GDB'})
