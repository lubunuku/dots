-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()


  -- Packer can manage itself
use 'wbthomason/packer.nvim'

use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}

use 'romgrk/nvim-treesitter-context'

use 'folke/twilight.nvim'

use 'yamatsum/nvim-cursorline'

use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons"
}

use {'neoclide/coc.nvim', branch = 'release'}

use 'b3nj5m1n/kommentary'

use 'tpope/vim-unimpaired'

use 'tpope/vim-surround'

use 'tpope/vim-repeat'

use 'max397574/better-escape.nvim'

use {
 "folke/which-key.nvim",
 config = function()
   require("which-key").setup {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the configuration section below
   }
 end
}

use 'b0o/mapx.nvim'

-- use {
--   'nvim-lualine/lualine.nvim',
--   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
-- }

-- use 'romgrk/barbar.nvim'

-- use 'glepnir/dashboard-nvim'

use 'lukas-reineke/indent-blankline.nvim'

use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
}

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'karb94/neoscroll.nvim'

use 'phaazon/hop.nvim'

use "Pocco81/AutoSave.nvim"

use 'jghauser/mkdir.nvim'

use 'tpope/vim-rsi'

-- use 'max-0406/autoclose.nvim'

use 'edluffy/specs.nvim'

use 'norcalli/nvim-colorizer.lua'

use({
	"catppuccin/nvim",
	as = "catppuccin"
})

end)
