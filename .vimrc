" Setup
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'powerline/powerline'

call vundle#end()
filetype plugin indent on

" Main Section
syntax enable

set ts=4
set sw=4
set autoindent
set smartindent

set nu
set rnu
set path+=**
set wildmenu
