return require('packer').startup(function(use)
  -- Configurations will go here soon
 use 'wbthomason/packer.nvim'
 use 'williamboman/mason.nvim'   
 use 'williamboman/mason-lspconfig.nvim'
 use 'neovim/nvim-lspconfig' 
 use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
 }
 use 'simrat39/rust-tools.nvim'
 
 -- Completion framework:
 use 'hrsh7th/nvim-cmp' 

 -- LSP completion source:
 use 'hrsh7th/cmp-nvim-lsp'

 -- Useful completion sources:
 use 'hrsh7th/cmp-nvim-lua'
 use 'hrsh7th/cmp-nvim-lsp-signature-help'
 use 'hrsh7th/cmp-vsnip'                             
 use 'hrsh7th/cmp-path'                              
 use 'hrsh7th/cmp-buffer'                            
 use 'hrsh7th/vim-vsnip'

 use 'nvim-treesitter/nvim-treesitter'
 use 'puremourning/vimspector'
 use 'voldikss/vim-floaterm'
 use 'p00f/clangd_extensions.nvim'
 use {
  "windwp/nvim-autopairs",
  config = function() require("nvim-autopairs").setup {} end
 }
 use 'ThePrimeagen/harpoon'
 use 'tanvirtin/monokai.nvim'
 use 'nvim-tree/nvim-web-devicons'
 use 'lewis6991/gitsigns.nvim'
 use 'feline-nvim/feline.nvim'
 use 'aznhe21/actions-preview.nvim'
end)
