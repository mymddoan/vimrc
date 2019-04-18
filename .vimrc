source $VIMRUNTIME/vimrc_example.vim

" Plugin stuff
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'wellle/targets.vim'

"Colorscheme
Plugin 'morhetz/gruvbox'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'chase/focuspoint-vim'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax enable
filetype plugin indent on
set spelllang=en_us
set encoding=utf-8

" tab stuff
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" search stuff
set incsearch
set hlsearch
set ignorecase smartcase

" general behavior
set number relativenumber
set showmatch
set clipboard=unnamedplus
set linebreak
set wildmenu
set wildmode=longest,list
set history=1000
set hidden
set laststatus=2
set autoread
set splitbelow splitright
set nobackup noswapfile noundofile
set tm=450

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.a,*.o
set wildignore+=*~,*.swp,*.tmp

colorscheme gruvbox
set background=dark

""Plugin Settings
let g:palenight_terminal_italics=1
let g:gruvbox_contrast_dark = 'hard'

let g:airline_theme='deus'

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_detect_whitespace = 0
let g:airline#extension#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

"" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

"" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0

"leader stuff
let mapleader=","
nnoremap <leader>s :w!<CR>
inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :mksession!<CR>
nnoremap <leader>v :split $MYVIMRC<CR>
nnoremap <leader>vv :so %<CR>
nnoremap <leader>M :%s/\s\+$//<cr>:let @/=''<CR>
set pastetoggle=<leader>z

"Fix for arrow key/terminal compatibility
nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

" switch tabs with tabs and buffers with Ctrl
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-RIGHT> :bn<CR>
nnoremap <C-LEFT> :bp<CR>

" resize split by shift arrow
nnoremap <S-Right> :vertical resize +5<CR>
nnoremap <S-Left> :vertical resize -5<CR>
nnoremap <S-Up> :res +5<CR>
nnoremap <S-Down> :res -5<CR> 

" switch split focus
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nnoremap ZA :qa<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap ; :
nnoremap : ;
nnoremap <F5> :make<CR>
" qq to record, Q to replay
nnoremap Q @q
"For tabbing to shift text
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap - $
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap cp yap}p
nnoremap gf :vertical wincmd f<CR>

inoremap jk <ESC>
vnoremap jk <ESC>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set expandtab

function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list =
    \ sort(map(
    \   filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
    \   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
