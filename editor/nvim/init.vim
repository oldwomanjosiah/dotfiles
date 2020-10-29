set nocompatible
let mapleader=" "

call plug#begin('~/.config/nvim/bundles')
Plug 'morhetz/gruvbox'

" Fuzzy Finding (Replacing Nerdtree)
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language Client for RLS
Plug 'autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': 'bash install.sh',
		\ }


" AutoCompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Language Support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'ron-rs/ron.vim'
Plug 'lervag/vimtex'

Plug 'harenome/vim-mipssyntax' " CS315 Mips Syntax

" GUI
Plug 'itchyny/lightline.vim'
Plug 'oldwomanjosiah/lightline-gruvbox.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'ryanoasis/vim-devicons'
call plug#end()

" Main Section
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nu
set rnu
set signcolumn=yes " For empty gitgutter
set scrolloff=3

set cursorline
set colorcolumn=81
set list
set listchars=tab:·\ ,trail:•
set lazyredraw
set shortmess+=c " For coc
set hidden " Allow switching through unwritten buffers

" Remap beginning and end of line to home row
map H ^
map L $

" Center Search Results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" File Finding
set path+=**
set wildmenu
set wildmode=list:longest

" Splits Remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Clear Arrow Keys
nnoremap <Up> <NoP>
nnoremap <Down> <NoP>
nnoremap <Left> <NoP>
nnoremap <Right> <NoP>

" Common mistypes
nnoremap :W :w
nnoremap :Q :q

" Change split behavior to match tmux
set splitright
set splitbelow

" Undo over time
set undodir=~/.config/nvim/.nvimdid
set undofile

" Fzf Shortcuts
nnoremap <Leader>b :Buffers<Cr>
nnoremap <C-p> :GFiles<Cr>
nnoremap <Leader>o :Files<Cr>

" coc options
nnoremap <Silent> <Leader>f :call CocAction('format')<Cr>
nnoremap <Leader>s :CocList outline<Cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <Leader><Leader> <C-^> " Map space-spcae to go to most recent buffer

" Unhighlight searches
nnoremap <Leader>h :nohlsearch<Cr>
vnoremap <Leader>h :nohlsearch<Cr>

" Lightline Options
let g:lightline#bufferline#unicode_symbols=1
let g:lightline_gruvbox_color='both'
set showtabline=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
		\   'colorscheme': 'gruvbox',
		\   'active': {
		\     'left': [ [ 'mode', 'paste' ],
		\				[ 'cocstatus' ],
		\               [ 'readonly', 'filename', 'modified' ] ],
		\     'right':[ [ 'gitstatus' ],
		\				[ 'percent' ],
		\				[ 'filetype', 'encoding', 'lineinfo' ] ]
		\   },
		\   'tabline': {
		\     'left': [ [ 'buffers' ] ],
		\     'right': [ [ 'tabs' ] ]
		\   },
		\   'component_function': {
		\     'filename': 'LightlineFilename',
		\     'cocstatus': 'coc#status',
		\     'gitstatus': 'LightlineGitStatus',
		\   },
		\   'component_expand': {
		\     'buffers': 'lightline#bufferline#buffers'
		\   },
		\   'component_type': {
		\     'buffers': 'tabsel'
		\   },
		\ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? WebDevIconsGetFileTypeSymbol() . ' ' . @% : '[No Name]'
endfunction
function! LightlineGitStatus() abort
	let status = get(g:, 'coc_git_status', '')
	return winwidth(0) > 100 ? status : ''
endfunction

" Coc
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Show type annotation
nnoremap <Leader>t :call CocAction('doHover')<Cr>
nnoremap <Leader>T :call CocAction('doHover')<Cr>

set noshowmode


" Start fzf if opened without file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call fzf#vim#files(".", 1) | endif

" Vimtex filetype options
let g:tex_flavor = 'latex'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Set Colorscheme
colorscheme gruvbox
