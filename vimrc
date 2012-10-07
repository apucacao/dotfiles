filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'jergason/scala.vim'
Bundle 'flazz/vim-colorschemes'

filetype plugin indent on
syntax on

set encoding=utf-8
set background=dark
set nocompatible
set ff=unix
set nowrap
set number
set ai
set modeline
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set backspace=indent,eol,start
set showmatch
set incsearch
set hlsearch
set history=1000
set backupdir=/tmp
set directory=/tmp
set foldmethod=manual
set vb
" set colorcolumn=80
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set listchars=tab:▸\ ,eol:¬

set wildmenu
set wildmode=list:longest,full

" status line
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

set scrolloff=9999 " minimum number of lines above/below the caret

color grb256
set cursorline

if has('gui_running')
  set mouse=a
  set guioptions+=mTrbLl
  set guioptions-=mTrbLl
else
  set t_Co=256
endif

" Custom filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Guardfile,*.ru}  set ft=ruby
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.json set ft=javascript

let mapleader=','

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" Parenthesis/bracket expanding
" credits: http://amix.dk/vim/vimrc.html
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $r <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $r ""<esc>i
inoremap $t <><esc>i

" Open/Close NERTTree
map <silent> <leader>f :NERDTreeToggle<cr>

" Close last open tag
imap <leader>/ </<c-x><c-o>

" Save
nmap <leader>w :w!<cr>

" Toggle spelling
map <leader>ss :setlocal spell!<cr>

" Toggle Buffergator panel
let g:buffergator_suppress_keymaps=1
map <leader>g :BuffergatorToggle<cr>

" Yank to OS clipboard.
noremap <leader>y "*y

" Tabularize
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:\zs<cr>
vmap <leader>a: :Tabularize /:\zs<cr>

" Command-T
nnoremap <silent> <leader>t :CommandT<cr>
nnoremap <silent> <leader>b :CommandTBuffer<cr>

set wildignore+=*.pyc,*.o,*.obj,.git

" Markdown preview with Marked.app
" Credits: http://captainbollocks.tumblr.com/post/9858989188/linking-macvim-and-marked-app
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Clear the search buffer
nnoremap <cr> :nohlsearch<cr>

" Exit insert mode
:imap <leader><leader> <Esc>

" Disable arrow keys
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

map <leader>. :t.<cr>

" Use leader for moving between panes
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l
