" ----------------------------------------------------------------------------------------------- "
" Cache
" ----------------------------------------------------------------------------------------------- "
if empty(glob('~/.cache/vim'))

  silent !mkdir -p ~/.cache/vim

endif

set dir=~/.cache/vim

set backupdir=~/.cache/vim

set nobackup

set nowritebackup

" ----------------------------------------------------------------------------------------------- "
" Plug
" ----------------------------------------------------------------------------------------------- "
if empty(glob('~/.vim/autoload/plug.vim'))

  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

endif

call plug#begin()

Plug 'preservim/nerdtree'

Plug 'unkiwii/vim-nerdtree-sync'

Plug 'vim-airline/vim-airline'

" brew install fzf ripgrep
"
Plug '/usr/local/opt/fzf'

Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install'}

Plug 'JuliaEditorSupport/julia-vim'

Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}

Plug 'tpope/vim-commentary'

Plug 'flazz/vim-colorschemes'

Plug 'luochen1990/rainbow'

call plug#end()

" ----------------------------------------------------------------------------------------------- "
" NERDTree
" ----------------------------------------------------------------------------------------------- "
nnoremap <leader>t :NERDTreeToggle<CR>

let NERDTreeCaseSensitiveSort = 1

let NERDTreeNaturalSort = 1

let NERDTreeIgnore = ['\.vim$', '\~$']

let NERDTreeMouseMode = 3

let NERDTreeSortOrder = []

let NERDTreeStatusline = -1

let NERDTreeWinSize = 77

let NERDTreeMinimalUI = 1

let NERDTreeMinimalMenu = 1

let NERDTreeCascadeSingleChildDir = 1

let NERDTreeAutoDeleteBuffer = 1

" ----------------------------------------------------------------------------------------------- "
" Vim NERDTree sync
" ----------------------------------------------------------------------------------------------- "
let g:nerdtree_sync_cursorline = 1

let g:NERDTreeHighlightCursorline = 1

" ----------------------------------------------------------------------------------------------- "
" fzf.vim (fzf)
" ----------------------------------------------------------------------------------------------- "
nnoremap <leader>f :Files<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}),
  \   <bang>0,
  \ )

" ----------------------------------------------------------------------------------------------- "
" fzf.vim (ripgrep)
" ----------------------------------------------------------------------------------------------- "
nnoremap <leader>r :Rg<CR>

" ----------------------------------------------------------------------------------------------- "
" coc.nvim
" ----------------------------------------------------------------------------------------------- "
let g:coc_global_extensions = ['coc-tabnine', 'coc-sh', 'coc-json', 'coc-julia', 'coc-html', 'coc-svelte']

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"
"  let col = col('.') - 1
"
"  return !col || getline('.')[col - 1]  =~# '\s'
"
"endfunction

" ----------------------------------------------------------------------------------------------- "
" markdown-preview.nvim
" ----------------------------------------------------------------------------------------------- "
nnoremap <leader>m :MarkdownPreview<CR>

let g:mkdp_refresh_slow=1

" ----------------------------------------------------------------------------------------------- "
" vim-colorschemes
" ----------------------------------------------------------------------------------------------- "
set background=dark

colorscheme gruvbox

" ----------------------------------------------------------------------------------------------- "
" rainbow
" ----------------------------------------------------------------------------------------------- "
let g:rainbow_active = 1

" ----------------------------------------------------------------------------------------------- "
" General
" ----------------------------------------------------------------------------------------------- "
set updatetime=160

set encoding=utf-8

set confirm

set hidden

set lazyredraw

set wildmenu

set guifont=Menlo-Regular:h15

set guicursor+=a:blinkon0

set belloff=all

set number

set signcolumn=number

set ruler

set laststatus=2

set cmdheight=1

syntax enable

set spell

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

set showmatch

set mps+=<:>

" ----------------------------------------------------------------------------------------------- "
" Auto-reload
" ----------------------------------------------------------------------------------------------- "
set autoread

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" ----------------------------------------------------------------------------------------------- "
" Style highlight
" ----------------------------------------------------------------------------------------------- "
highlight Search ctermbg=92 ctermfg=yellow guibg=#9016e6 guifg=#20d8ba

" ----------------------------------------------------------------------------------------------- "
" Highlight word-under-cursor instances
" ----------------------------------------------------------------------------------------------- "
highlight WordUnderCursor cterm=underline,bold gui=underline,bold

autocmd CursorHold * call HighlightCursorWord()

function! HighlightCursorWord()

    let search = getreg('/')

    let cword = expand('<cword>')

    if match(cword, search) == -1

        exe printf('match WordUnderCursor /\V\<%s\>/', escape(cword, '/\'))

    endif

endfunction

" ----------------------------------------------------------------------------------------------- "
" Map
" ----------------------------------------------------------------------------------------------- "
:let maplocalleader = "`"

nnoremap <leader>b :Buffers<CR>

nnoremap <leader>h :nohlsearch<CR>
