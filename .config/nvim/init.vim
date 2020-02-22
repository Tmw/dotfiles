filetype off

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'mileszs/ack.vim'

" Theming
Plug 'morhetz/gruvbox'

" Language support ~ Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Language support ~ Front-End
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json',
  \ 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'maxmellon/vim-jsx-pretty'


" Initialize plugin system
call plug#end()
filetype plugin indent on

" Setup theming
set encoding=utf-8
syntax on
colorscheme gruvbox
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
set mouse=a " Some mouse is ok.
set ignorecase

" NERDTree preferences
nmap <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" This supposedly hides the brackets in NERDTree
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" NERDCommenter preferences
let g:NERDToggleCheckAllLines = 1
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Moving between splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Making splits
 set splitbelow
 set splitright

 " Mark the 80 chars line
 set colorcolumn=80

" Gruvbox + Powerline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
set t_Co=256

" Elixir preferences
let g:mix_format_on_save = 1
" let g:alchemist_tag_disable = 1 " Disable jumping to definitions until it works

" JS/TS preferences
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
