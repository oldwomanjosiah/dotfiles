" Setup
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-AirLine/vim-AirLine'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'igrmk/kull-vim'
Plugin 'theJian/Mogao'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'airblade/vim-gitgutter'
Plugin 'tfnico/vim-gradle'

call vundle#end()
filetype plugin indent on

" Main Section
syntax enable

set ts=4
set sw=0
set autoindent
set smartindent
set expandtab!

set nu
set rnu
set path+=**
set wildmenu

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remaps
nnoremap <C-J> <C-W><C-J> " Move Split Down
nnoremap <C-K> <C-W><C-k> " Move Split Up
nnoremap <C-L> <C-W><C-L> " Move Split Right
nnoremap <C-H> <C-W><C-H> " Move Split Left
map      <C-n> :NERDTreeToggle<CR> " Toggle Nerd Tree

" Tmux Like Split Behavior
set splitbelow
set splitright

command! Q :q

" Theme Selection
let g:airline#extensions#tabline#enabled = 1
set signcolumn=yes
set background=dark
autocmd VimEnter * AirlineTheme gruvbox
autocmd VimEnter * colorscheme gruvbox
