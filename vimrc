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

Plug 'preservim/nerdtree'

" brew install fzf ripgrep
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'codota/tabnine-vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Set up language servers: CocInstall coc-sh coc-html coc-json coc-julia coc-pyright

Plug 'JuliaEditorSupport/julia-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'tpope/vim-commentary'

Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'luochen1990/rainbow'

call plug#end()

" ================================================================================
" nerdtree
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
" fzf.vim (fzf)
" ================================================================================
nnoremap <leader>fi :Files<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}),
  \   <bang>0,
  \ )

" ================================================================================
" fzf.vim (ripgrep)
" ================================================================================
nnoremap <leader>rg :Rg<CR>

" ================================================================================
" vim-gitgutter
" ================================================================================

" ================================================================================
" nerdtree-git-plugin
" ================================================================================

" ================================================================================
" tabnine-vim
" ================================================================================

" ================================================================================
" vim-polyglot
" ================================================================================

" ================================================================================
" coc.nvim
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
" julia-vim
" ================================================================================

" ================================================================================
" markdown-preview.nvim
" ================================================================================
nnoremap <leader>m :MarkdownPreview<CR>

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css=expand('~/craft/environment/markdown.css')

" ================================================================================
" vim-commentary
" ================================================================================

" ================================================================================
" vim-colorschemes
" ================================================================================
set background=dark
colorscheme gruvbox

" ================================================================================
" goyo
" ================================================================================
nnoremap <leader>g :Goyo<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ================================================================================
" limelight
" ================================================================================
nnoremap <leader>l :Limelight!!<CR>

let g:limelight_conceal_ctermfg=244

" ================================================================================
" rainbow
" ================================================================================
let g:rainbow_active = 1

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
" Highlight articles
" ================================================================================
nnoremap <leader>a /\v<a>\|<an>\|<the>\|s 

" ================================================================================
" 
" ================================================================================

