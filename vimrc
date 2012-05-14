filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle "altercation/vim-colors-solarized"
Bundle "tsaleh/vim-matchit"
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

let mapleader=","

" Parenthesis/bracket expanding
" credits: http://amix.dk/vim/vimrc.html
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" Open/Close NERTTree
map <silent> <leader>f :NERDTreeToggle<CR>

" Close last open tag
imap <leader>/ </<C-X><C-O>

" Save
nmap <leader>w :w!<CR>

" Toggle spelling
map <leader>ss :setlocal spell!<CR>
