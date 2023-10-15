syntax on
set number
set hlsearch
set nocompatible   " be improved, required
filetype off       " required
" store the plugins in plugged dir
call plug#begin('~/.config/nvim/plugged')
Plug 'folke/tokyonight.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' 
call plug#end()
lua <<EOF
require("nvim-autopairs").setup {}
require('Comment').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
require('go').setup()
EOF

" select the color scheme
colorscheme tokyonight-storm
