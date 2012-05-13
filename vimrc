filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-surround"
Bundle "msanders/snipmate.vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "mileszs/ack.vim"
Bundle "henrik/vim-open-url"
Bundle "henrik/vim-reveal-in-finder"
Bundle "pangloss/vim-javascript"
Bundle "wincent/Command-T"
Bundle "scrooloose/nerdtree"

filetype plugin indent on
syntax on

set background=dark
set nocompatible
set ff=unix
set number
set ai
set modeline
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set backspace=indent,eol,start
set showmatch
set history=1000
set backupdir=/tmp
set directory=/tmp
set foldmethod=manual
set vb
set colorcolumn=80

let mapleader=","

" Mappings
map <silent> <leader>f :NERDTreeToggle<CR>

if has('gui_running')
    set mouse=a
    set background=light
    color solarized
    set guioptions+=mTrbLl
    set guioptions-=mTrbLl
    set guifont=Monaco:h12

    set cursorline

    " Change font size
    map <silent> <leader>+ :set guifont=Menlo:h14<CR>
    map <silent> <leader>- :set guifont=Menlo:h12<CR>
endif

" Custom filetypes
au BufNewFile,BufRead *.md set ft=markdown

" Startup commands
" autocmd vimenter * NERDTree
