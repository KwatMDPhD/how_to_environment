" ================================================================================
" General
" ================================================================================
if empty(glob('~/.cache/vim'))
  silent !mkdir -p ~/.cache/vim
endif
set dir=~/.cache/vim
set backupdir=~/.cache/vim

set nobackup
set nowritebackup

set updatetime=200

set encoding=utf-8

set confirm
set hidden
set lazyredraw
set wildmenu

set guifont=Menlo-Regular:h16
set guicursor+=a:blinkon0
set belloff=all

highlight SignColumn guibg=NONE guifg=NONE ctermbg=NONE ctermbg=NONE
highlight Cursor guibg=#20d9ba guifg=#ebf6f7

set number
set signcolumn=number
set ruler
set laststatus=2
set cmdheight=1

syntax enable

set linebreak
set scrolloff=8
set sidescrolloff=8
set nofoldenable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <leader>nh :nohlsearch<CR>
set showmatch

set mps+=<:>

" ================================================================================
" Plug
" ================================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'flazz/vim-colorschemes'

Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

" brew install fzf ripgrep
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Set up language servers: CocInstall coc-sh coc-html coc-json coc-julia coc-pyright
Plug 'JuliaEditorSupport/julia-vim'
Plug 'codota/tabnine-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" ================================================================================
" Colorscheme
" ================================================================================
set background=dark
colorscheme gruvbox

" ================================================================================
" Rainbow (bracket)
" ================================================================================
let g:rainbow_active = 1

" ================================================================================
" NERDTree
" ================================================================================
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>

let NERDTreeCaseSensitiveSort = 1
let NERDTreeNaturalSort = 1
let NERDTreeIgnore=['\.vim$', '\~$']
let NERDTreeMouseMode = 3
let NERDTreeSortOrder = []
let NERDTreeStatusline = -1
let NERDTreeWinSize = 48
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 1
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeAutoDeleteBuffer = 1

" ================================================================================
" FZF 
" ================================================================================
nnoremap <leader>fi :Files<CR>
nnoremap <leader>rg :Rg<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}),
  \   <bang>0,
  \ )

" ================================================================================
" CoC 
" ================================================================================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ================================================================================
" Highlight all instances of word under cursor
" ================================================================================
setl updatetime=300

highlight WordUnderCursor cterm=underline gui=underline
autocmd CursorHold * call HighlightCursorWord()
function! HighlightCursorWord()
    let search = getreg('/')
    let cword = expand('<cword>')
    if match(cword, search) == -1
        exe printf('match WordUnderCursor /\V\<%s\>/', escape(cword, '/\'))
    endif
endfunction

" ================================================================================
" Limelight
" ================================================================================
nnoremap <leader>l :Limelight!!<CR>

" ================================================================================
" Goyo
" ================================================================================
nnoremap <leader>g :Goyo<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
