call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/taglist.vim'

Plug 'python-mode/python-mode'
Plug 'tmhedberg/SimpylFold'
Plug 'heavenshell/vim-pydocstring'

Plug 'SirVer/ultisnips'
Plug 'moberst/vim-snippets'
Plug 'ervandew/supertab'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'lervag/vimtex'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'jnurmine/Zenburn'

call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required

if exists('g:gui_oni')
  set number
  set noswapfile
  set smartcase

  " Enable GUI mouse behavior
  set mouse=a

  " If using Oni's externalized statusline, hide vim's native statusline, 
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
endif

" Nvim specific setup

" Source for python
let g:python3_host_prog='/home/moberst/.miniconda3/bin/python3'
let g:ale_linters = {'python': ['autopep8']}

" No fancy cursor nonsense, we do it old school
set guicursor=

"" Old VIM setup, but cut down due to redundant plugins

" GENERAL setup
colorscheme zenburn

" Sweet search options!
set incsearch
set hlsearch

set number
set encoding=utf-8
set colorcolumn=81
set tags=tags

" Tag list toggle
nnoremap <silent> <F8> :TlistToggle<CR>

" Alias some stupid bugs
:command W w
:command Xa xa

if $TERM == 'screen'
  set t_Co=256
endif

set wrap linebreak nolist 

" Set indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" Setup for snippets
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical" 

" Setup for vimtex
let g:vimtex_fold_enabled = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_toc_enabled = 1

let g:vimtex_compiler_method='latexmk'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : './tex',
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

" Setup for plasticboy/vim-markdown
set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1

" Setup for JamshedVesuna/vim-markdown-preview
" Map markdown preview to CTRL-M
let vim_markdown_preview_hotkey='<C-M>'
" Display images
let vim_markdown_preview_toggle=1
" Use grip for markdown preview
let vim_markdown_preview_github=1
" Remove temp file after loading in browser
let vim_markdown_preview_temp_file=1

" Use spaces instead of tabs, and keep the whitespace small
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set backspace=2 " make backspace work like most other apps

" Switch between splits using ctr+j/k/l/h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Mappings for CtrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" NERDtree settings
" Toggle Nerdtree with C-T
map <C-T> :NERDTreeToggle<CR>
" Close Vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Latex setup
au BufNewFile,BufRead *.tex
    \ set spell | 
    \ set spellfile=$HOME/Dropbox/org/tex/en.utf-8.add

" PYTHON setup
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let python_highlight_all=1
syntax on

let g:deoplete#enable_at_startup = 1
