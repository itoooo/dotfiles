" Setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin lists
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'dracula/vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'derekwyatt/vim-scala'
Plugin 'pangloss/vim-javascript'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'klen/python-mode'

call vundle#end()
filetype plugin indent on
" End of Vundle configuration

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" powerline
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" override default settings to show powerline
set laststatus=2
set showtabline=2
set noshowmode

" terminal color
set termguicolors

" Open NERDTree if no files wrer specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" fzf mapping
let mapleader = "\<Space>"
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>cl :Lines<CR>
nnoremap <Leader>t :Tags<CR>

" Enable neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1

" key-mappings
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable heavy omni completion
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" neocomplete go lang setting
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

" General settings
syntax on
filetype plugin indent on
set background=dark
color dracula
set t_Co=256
set number

" Prevent backgroud color issue in tmux
set t_ut=

" vim-go settings
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_autosave = 0

" tagbar settings
nmap <F8> :TagbarToggle<CR>

" FileType overrides
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType erlang setlocal expandtab shiftwidth=2 tabstop=2

" python-mode settings
let g:pymode_python = 'python3'
let g:pymode_folding = 0

