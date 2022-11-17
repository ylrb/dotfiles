vim.opt.showmode = false

require('lualine').setup {
    options = {
        icons_enabled = true,
     	component_separators = '',
    	section_separators = { left = '', right = ''},
		globalstatus = true,
	},
	sections = {
    	lualine_a = {'mode'},
		lualine_b = {},
    	lualine_c = {'filename', 'branch', 'diff', 'diagnostics'},
    	lualine_x = {'filetype', 'encoding'},
    	lualine_y = {},
    	lualine_z = {'progress'}
	},
}
