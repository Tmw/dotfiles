filetype off

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-grepper'
Plug 'yssl/QFEnter'

" Theming
Plug 'morhetz/gruvbox'

" Language support ~ Ruby
Plug 'vim-ruby/vim-ruby'

" Language support ~ Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

" Language support ~ Rust
Plug 'rust-lang/rust.vim'

" Language support ~ Swift
Plug 'toyamarinyon/vim-swift'

" Language support ~ Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Lanuage support ~ GraphQL
Plug 'jparise/vim-graphql'

" Language support ~ Front-End
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" coc extensions
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier', 'coc-elixir', 'coc-eslint']

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

" Gruvbox + Powerline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
set t_Co=256

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
