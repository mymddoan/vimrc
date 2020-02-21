" Plugin stuff
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
set rtp+=~/.fzf
"call plug#begin('~/.nvim/plugged')

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

"Status Bar"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'

"Start Screen"
Plugin 'mhinz/vim-startify'

"Add Functionality"
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'wlemuel/vim-tldr'

"Language Specific Plugins"
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'
Plugin 'sheerun/vim-polyglot'

"Color Scheme"
Plugin 'chase/focuspoint-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'

"''if v:version >= 8.0
"'    Plugin 'fatih/vim-go'
"'    Plugin 'prabirshrestha/async.vim'
"'    Plugin 'prabirshrestha/vim-lsp'
"'    Plugin 'prabirshrestha/asyncomplete.vim'
"'    Plugin 'prabirshrestha/asyncomplete-lsp.vim'
"'endif
"

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

"Tab Stuff"
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

"Search Stuff"
set incsearch
set hlsearch
set ignorecase smartcase

"General Behavior"
set number relativenumber
set showmatch
set clipboard^=unnamed,unnamedplus
set linebreak
set wildmenu
set wildmode=longest,list
set history=1000
set hidden
set laststatus=2
set autoread
set splitbelow splitright
set nobackup noswapfile
set tm=450

"Don't offer to open certain files/directories"
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.a,*.o
set wildignore+=*~,*.swp,*.tmp

set background=dark

"Plugin Settings"
let g:tldr_directory_path = '~/.cache/tldr'
let g:palenight_terminal_italics=1

let g:airline_powerline_fonts = 0
let g:airline_theme='alduin'

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

"Disable tabline close button"
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

"Just show the file name"
let g:airline#extensions#tabline#fnamemod = ':t'
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0

"LSP Appearance"
let g:lsp_signs_enabled = 0         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠ '}
let g:lsp_signs_information = {'text': '▶'}

nnoremap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nnoremap ++ <plug>NERDCommenterToggle

colorscheme focuspoint

let g:NERDTreeGitStatusWithFlags = 1

"Leader Stuff"
let mapleader=","
nnoremap <leader>d :sh<cr>
nnoremap <leader>w :mksession!<CR>
nnoremap <leader>v :split $MYVIMRC<CR>
nnoremap <leader>f :LspDocumentDiagnostic<CR>
nnoremap <leader>M :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>e :call JsBeautify()<cr>
set pastetoggle=<leader>z

"Fix for arrow key/terminal compatibility"
nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

"Fix for cursor/terminal"
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"Switch tabs with tabs and buffers with Ctrl"
nnoremap <C-Down> <ESC>:tabnext<CR>
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-RIGHT> :bn<CR>
nnoremap <C-LEFT> :bp<CR>

"Resize Split By Shift Arrow"
nnoremap <S-Right> :vertical resize +5<CR>
nnoremap <S-Left> :vertical resize -5<CR>
nnoremap <S-Up> :res +5<CR>
nnoremap <S-Down> :res -5<CR>

"Switch Split Focus"
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

"qq to record, Q to replay"
nnoremap Q @q

"For tabbing to shift text"
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"General Shortcut"
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <F5> :make<CR>
nnoremap - $
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap cp yap}p
nnoremap gf :vertical wincmd f<CR>
nnoremap ZA :qa<CR>

nnoremap ; :
nnoremap : ;
inoremap jk <ESC>
vnoremap jk <ESC>

"Move visual block"
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

"Automatically source vimrc on save."
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

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

"LSP CONFIGURATION"
"if executable('pyls')
"  " pip install python-language-server
"  augroup LspPython
"    au!
"    autocmd User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ })
"    autocmd FileType python setlocal omnifunc=lsp#complete
"  augroup END
"endif
"
"if executable('clangd')
"    " sudo pacman -S clang-tools-extra
"    augroup LspC
"        au!
"        autocmd User lsp_setup call lsp#register_server({
"                \ 'name': 'clangd',
"                \ 'cmd': {server_info->['clangd', '-background-index']},
"                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                \ })
"        autocmd FileType c setlocal omnifunc=lsp#complete
"    augroup END
"endif
"
"if executable('gopls')
"    "GO111MODULE=on go get golang.org/x/tools/gopls
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'gopls',
"        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
"        \ 'whitelist': ['go'],
"        \ })
"    autocmd BufWritePre *.go LspDocumentFormatSync
"endif
"
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
