-- Auto install Packer if not present
local ensure_packer = function()
   	local fn = vim.fn
   	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   	if fn.empty(fn.glob(install_path)) > 0 then
       	fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
       	vim.cmd [[packadd packer.nvim]]
    	return true
   	end
   	return false
end
local packer_bootstrap = ensure_packer()

-- Plugins
require('packer').startup(function(use)

	-- Plugin manager
	use { 'wbthomason/packer.nvim' }

    -- Theme
	use { 'vimoxide/vim-cinnabar' }
	use { 'lucasprag/simpleblack' }
	use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end,
    }
	use {'romgrk/barbar.nvim',
		config = function() require('plugins.barbar') end,
	}

	-- IDE Styling
    use { 'rktjmp/highlight-current-n.nvim',
        config = function() require('plugins.highlight-current-n') end,
    }
	use { 'NvChad/nvim-colorizer.lua' }
	use { 'sunjon/Shade.nvim',
		config = function() require('plugins.shade') end,
	}

	-- IDE Features
	use { 'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end,
    }
    use { 'rafamadriz/friendly-snippets' }
    use { 'moll/vim-bbye' }

	-- Code manipulation 
    use { 'tpope/vim-repeat' }

    -- Navigation
    use { 'ptzz/lf.vim',
	    requires = { 'voldikss/vim-floaterm' },
        config = function() require('plugins.lf') end,
    }
    use { 'nvim-telescope/telescope.nvim',
        config = function() require('plugins.telescope') end,
    }

	-- Utilities
    use { 'nvim-lua/plenary.nvim' }

    -- Sync on first launch
    if packer_bootstrap then
        require('packer').sync()
    end

end)
