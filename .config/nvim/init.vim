filetype off

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Neovim language server support and advanced highlighter
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'editorconfig/editorconfig-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-grepper'
Plug 'yssl/QFEnter'

Plug 'RRethy/vim-illuminate'

" Theming
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'

" Language support ~ Ruby
Plug 'vim-ruby/vim-ruby'

" Language support ~ Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

" Language support ~ Rust
Plug 'rust-lang/rust.vim'

" Language support ~ Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Lanuage support ~ GraphQL
Plug 'jparise/vim-graphql'
"
" Language support - TypeScript
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" Initialize plugin system
call plug#end()


" Configure lsp
lua << EOF

local lspconfig = require('lspconfig')

-- TODO: Elixir language server
-- lspconfig.elixirls.setup{
  -- cmd = { "/Users/tiemen/Development/elixir-ls/release/language_server.sh" };
-- }

-- Configure eslint / prettier
require('lsp'):setup()
-- END Configure eslint / prettier

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { },

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}


local cmp = require('cmp')
-- monkey patch the cmp.mapping with next / previous item
cmp.mapping.select_next_item = function()
  return function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end
end

cmp.mapping.select_prev_item = function()
  return function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end
end

local cmp_select_next_suggestion = function(fallback)
end
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    -- using return key or CTRL+Y to accept a completion
    ["<cr>"] = cmp.mapping.confirm(),
    ["<C-y>"] = cmp.mapping.confirm(),

    -- using tab key or CTRL + J to select next item in the list
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),

    -- using shift + tab key or CTRL + K to select next item in the list
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip'},
    { name = 'buffer' },
  })
})
require('lualine').setup{}

-- configure the git status line to be using a bit thicker lines for additions and changes.
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▍', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▍', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

EOF

filetype plugin indent on

" Setup theming
set encoding=utf-8
syntax on
"colorscheme gruvbox
colorscheme tokyonight
set noshowmode
set cursorline

" Setup code folding
set foldmethod=indent
set foldlevel=99

" Set editor defaults
set tabstop=2
set shiftwidth=2
set expandtab
set wildmenu
set wildmode=longest:full,full
set tags=tags
set number relativenumber
set expandtab
set list
set listchars=tab:!·,trail:·
set mouse=a " Some mouse is ok.
set ignorecase

" NERDTree preferences
" ---------------------
"
" How do we toggle NerdTree
nmap <C-b> :NERDTreeToggle<CR>

" Hide by default
let NERDTreeShowHidden=1

" Adjust bindings to match FZF: ctrl+x, ctrl+v for horizontal / vertical
" splits and ctrl+t for new tab
let NERDTreeMapOpenSplit='<C-X>'
let NERDTreeMapOpenVSplit='<C-V>'
let NERDTreeMapOpenInTab='<C-T>'

" This supposedly hides the brackets in NERDTree
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" NERDCommenter preferences
let g:NERDToggleCheckAllLines = 1
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Movements between splits
" ------------------------
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Making splits
" ------------------------
set splitbelow
set splitright

 " Configure QFEnter mappings
 " How do we open QuickFix items
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']


" Mark the 80 chars line
set colorcolumn=80

" Elixir preferences
let g:mix_format_on_save = 1

" Remap CTRL+P to fzf.vim
nnoremap <silent> <C-p> :Files<CR>

" Quick copy filepath to clipboard
nnor ,cf :let @*=expand("%:p")<CR>

" mark typescript and tsx files accordingly
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" auto enable spellcheck for markdown and commits
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
