local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

cmp.setup({

	-- Add borders around the popup window
	window = {
		completion = cmp.config.window.bordered(),
	},

})

-- Enable command-line completion
cmp.setup.cmdline(':', {
	sources = {
		{ name = 'cmdline' },
	},
	formatting = {
		fields = { "abbr" },
	}
})
