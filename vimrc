" ================================================================================
" Appearance
" ================================================================================
set title

set guifont=Menlo-Regular:h16

"set lines=72

"set columns=96

set number

set laststatus=2

set ruler

" ================================================================================
" Language
" ================================================================================
"set encoding=utf-8

syntax enable

" ================================================================================
" Line
" ================================================================================
"set wrap

set linebreak

"set display+=lastline

set scrolloff=8

set sidescrolloff=8

set nofoldenable

" ================================================================================
" Indent
" ================================================================================
set tabstop=4

set softtabstop=4

set shiftwidth=4

set expandtab

"set autoindent

"filetype plugin indent on 

"set backspace=indent,eol,start

" ================================================================================
" Search
" ================================================================================
set incsearch

set hlsearch

set ignorecase

set smartcase

" Use \ to clear search highlight
nnoremap <leader> :nohlsearch<CR>

" ================================================================================
" Highlight
" ================================================================================
set showmatch

set mps+=<:>

" ================================================================================
" Error
" ================================================================================
set belloff=all

"set noerrorbells

"set novisualbell

" ================================================================================
" Interface
" ================================================================================
set lazyredraw

set wildmenu

"set mouse=a

" ================================================================================
" Input and output
" ================================================================================
"set autoread

"set history=1000

" Establish ~/.cache/vim
if empty(glob('~/.cache/vim'))
  silent !mkdir -p ~/.cache/vim
endif

set dir=~/.cache/vim

set backupdir=~/.cache/vim

set confirm

" ================================================================================
" Plug
" ================================================================================
" Install plug, which is a plugin manager for vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins
call plug#begin()

Plug 'preservim/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug '/usr/local/opt/fzf'
" Install fzf: brew install fzf

Plug 'frazrepo/vim-rainbow'

Plug 'altercation/vim-colors-solarized'

"Plug 'sheerun/vim-polyglot'
"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Set up language servers: CocInstall coc-sh coc-html coc-json coc-julia coc-pyright
""
"Plug 'codota/tabnine-vim'
"
"Plug 'dense-analysis/ale'
"" Install language specific linters
"
"Plug 'JuliaEditorSupport/julia-vim'

" End of list
call plug#end()

" ================================================================================
" Color scheme
" ================================================================================
set background=dark

colorscheme solarized

" ================================================================================
" NerdTree
" ================================================================================
" Use ctrl-t to toggle
map <C-t> :NERDTreeToggle<CR>

" ================================================================================
" CoC
" ================================================================================
" Use tab to navigate suggestions down and complete
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()

" Use shift-tab to navigate suggestions up and complete
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
