local db = require('dashboard')

db.hide_statusline = false
local clock = os.date("%H:%M")
local date = os.date("%d/%m/%y")
db.default_banner = {
	'',
  	' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ',
  	' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ',
  	' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ',
  	' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ',
  	' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ',
  	' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ',
	'',
  	''..clock..' '..date..'',
	'',
}
db.custom_center = {
    { 	icon = ' ',
		desc = 'Explore ',
		action = 'Lf',
	},
    { 	icon = ' ',
		desc = 'History ',
		action =  'Telescope oldfiles',
	},
	{ 	icon = ' ',
		desc = 'Session ',
		action = 'SessionLoad'
	},
    { 	icon = ' ',
		desc = 'Plugins ',
		action = 'PackerSync',
	},
    { 	icon = ' ',
		desc = 'Keymaps ',
		action = 'Telescope keymaps',
	},
}
local count = #vim.tbl_keys(packer_plugins)
db.custom_footer = { '', ' ' ..count.. ' plugins loaded', '', '', '', '' }
