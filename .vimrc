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

" Indentation
set ts=4
set sw=0
set autoindent
set smartindent
set expandtab!

" Numbering
set nu
set rnu

" File Finding
set path+=**
set wildmenu

" Nerdtree startup and shudown config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YouCompleteMe Options
let g:ycm_autoclose_preview_window_after_completion = 1 " Close preview window when insert mode is left

" Remaps
nnoremap <C-J> <C-W><C-J> " Move Split Down
nnoremap <C-K> <C-W><C-k> " Move Split Up
nnoremap <C-L> <C-W><C-L> " Move Split Right
nnoremap <C-H> <C-W><C-H> " Move Split Left
map      <C-n> :NERDTreeToggle<CR> " Toggle Nerd Tree

" Tmux Like Split Behavior
set splitbelow
set splitright

" Remap common mistype
command! Q :q

" Theme Selection
let g:airline#extensions#tabline#enabled = 1 "Show tabline with open buffers
set signcolumn=yes " Always show gutter for gitgutter, even when empty
set background=dark " Set gruvmox background default colorsheme
autocmd VimEnter * colorscheme gruvbox
autocmd VimEnter * AirlineTheme gruvbox
