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
	use { 'kyazdani42/nvim-web-devicons' }	
    use { 'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end,
    }

	-- IDE Styling
    use { 'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.indent-blankline') end,
    }
    use { 'karb94/neoscroll.nvim',
        config = function() require('plugins.neoscroll') end,
    }
    use { 'rktjmp/highlight-current-n.nvim',
        config = function() require('plugins.highlight-current-n') end,
    }

	-- IDE Features
	use { 'numToStr/Comment.nvim',
        config = function() require('plugins.comment') end,
    }
	use { 'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end,
    }
    use { 'tpope/vim-fugitive' }
    use { 'L3MON4D3/LuaSnip',
        config = function() require('plugins.luasnip') end,
    }
    use { 'rafamadriz/friendly-snippets' }
    use { 'moll/vim-bbye' }
    use {
        'akinsho/toggleterm.nvim',
        config = function() require('plugins.toggleterm') end,
    }

	-- Code manipulation 
 	-- :TSInstall for adding languages
	use { 'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'wellle/targets.vim' }
    use { 'tpope/vim-repeat' }

	-- LSP
    -- More here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	use { 'neovim/nvim-lspconfig',
        config = function() require('plugins.lspconfig') end,
    }

	-- Autocomplete
	use { 'hrsh7th/nvim-cmp',
        config = function() require('plugins.cmp') end,
    }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'petertriho/cmp-git' }



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
    use { 'moll/vim-bbye' }

    -- Sync on first launch
    if packer_bootstrap then
        require('packer').sync()
    end
	
end)
