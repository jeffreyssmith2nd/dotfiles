call plug#begin('~/.local/share/nvim/plugged')


" Colors
Plug 'phanviet/vim-monokai-pro'


" Navigation/Workflow
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'junegunn/vim-easy-align'


" Language plugins
Plug 'sheerun/vim-polyglot'
Plug 'bfrg/vim-cpp-modern'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'dag/vim-fish'


" Completion/Workers
Plug 'w0rp/ale'
Plug 'sirver/ultisnips'
Plug 'fatih/vim-go'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


" Options
if has('macunix')
    " Use default path
else
  let g:python3_host_prog = '/home/jssmith/.pyenv/versions/neovim3/bin/python'
endif


" Initialize plugin system
call plug#end()

" Plugin {{{
filetype plugin on
filetype plugin indent on

let c_no_curly_error=1

let g:deoplete#enable_at_startup = 1

let g:chromatica#libclang_path=$HOME . '/bin/clang_llvm_8/lib'
let g:chromatica#enable_at_startup=0
let g:chromatica#responsive_mode=1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['add_blank_lines_for_python_control_statements', 'black', 'trim_whitespace'],
\   'typescript': ['tslint'],
\}

let g:ale_fix_on_save = 0

let g:ale_linters = {
\   'python': ['mypy'],
\}

" Font Settings
let g:enable_bold_font = 1
let g:polyglot_disabled = ['cpp']

" UltiSnips
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=45                                                      " Change NERDTree size
au VimEnter * wincmd l                                                        " Remove focus from NERDTree window at startup.

" Terraform
let g:terraform_align=1
" }}}

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has('termguicolors'))
 set termguicolors
endif

syntax enable
set background=dark
colorscheme my_colors

" Misc {{{
set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
set ttyfast                     " faster redraw
set backspace=indent,eol,start
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

set backupdir=~/.vim/backups
set noundofile
"}}}

" Spaces & Tabs {{{
" Default Settings
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modeline
set modelines=1
set autoindent
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
set matchtime=3
set nowrap
set colorcolumn=80
set scrolloff=10
highlight ColorColumn ctermbg=darkgray
" }}}

" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" Folding {{{
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
" }}}

" Splits {{{
set splitbelow
set splitright
" }}}

" Key Remappings {{{
" Plugin key mappings

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Toggle NERDTree view
map <Leader><Leader>] :NERDTreeToggle<CR>

" Focus NERDTree view
map <Leader><Leader>[ :NERDTreeFocus<CR>

" Standard key mappings
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <Leader><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader><Leader>> :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Leader>< :exe "veritcal resize " . (winheight(0) * 2/3)<CR>

nnoremap <Leader><Leader>cc :let &scrolloff=999-&scrolloff<CR>


nnoremap <A-Home> <Esc>
inoremap <A-Home> <Esc>

nnoremap <space> za
nnoremap <Nul> zM

tnoremap <Leader><Leader><Esc> <C-\><C-n>

"tab mappings
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-t> :tabnew<CR>
map <D-w> :tabclose<CR>

let mapleader="\\"

" format json
com! FormatJSON %!python -m json.tool

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" fix highlight
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

nmap <Leader><Leader>q :pc<CR>

" Neomake stuff
" open location window
nmap <Leader><Leader>o :lopen<CR>
" close location window
nmap <Leader><Leader>c :lclose<CR>
" go to current error/warning
nmap <Leader><Leader>, :ll<CR>
" next error/warning
nmap <Leader><Leader>n :lnext<CR>
" previous error/warning
nmap <Leader><Leader>p :lprev<CR>
" run Neomake
nmap <Leader>n :Neomake<CR>

" }}}

" Languages {{{
autocmd Filetype css setlocal shiftwidth=2 tabstop=2
autocmd Filetype html setlocal shiftwidth=2 tabstop=2
autocmd Filetype htmldjango setlocal shiftwidth=2 tabstop=2
autocmd Filetype ruby setlocal shiftwidth=2 tabstop=2

autocmd Filetype javascript setlocal colorcolumn=120
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2

autocmd Filetype typescript setlocal colorcolumn=120
autocmd Filetype typescript setlocal shiftwidth=2 tabstop=2

autocmd Filetype cpp setlocal colorcolumn=120
autocmd Filetype cpp setlocal shiftwidth=3 tabstop=3

autocmd Filetype python setlocal colorcolumn=100

autocmd Filetype go setlocal colorcolumn=120

au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy

" }}}

" vim:foldmethod=marker:foldlevel=0
