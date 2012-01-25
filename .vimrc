" Auto Commands

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |
        \   endif |
        \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
augroup END


" Misc Settings

" Necessary  for lots of cool vim things
set nocompatible

" show what my commands are
set showcmd


" Needed for Syntax Highlighting and stuff
filetype on
syntax enable
set grepprg=grep\ -nH\ $*

" Bundler
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_solarized_bg='dark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='bubblegum'
let g:airline_section_b=''
let g:airline_section_y='Ⅲ %{col(".")}'
let g:airline_section_x=''
let g:airline_section_z = "\U0950 "



Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'RRethy/vim-illuminate'
Plugin 'Raimondi/delimitMate'
Plugin 'Shutnik/jshint2.vim'
Plugin 'aflock/vim-colorpack'
Plugin 'duff/vim-bufonly'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'keith/swift.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mtth/scratch.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'unblevable/quick-scope'
Plugin 'vim-python/python-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Align'
Plugin 'w0rp/ale'
Plugin 'wincent/terminus'

set diffopt+=vertical

let g:python_highlight_all = 1

let g:ale_set_highlights = 0

let g:vimrubocop_config = '~/src/coinbase/.rubocop.yml'
let g:ale_ruby_rubocop_executable = 'rubocop'

let g:github_enterprise_urls = ['https://github.cbhq.net']

call vundle#end()            " required
filetype plugin indent on    " required

if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore sorbet'
endif

" quick scope
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')
onoremap <expr> <silent> f Quick_scope_selective('f')
onoremap <expr> <silent> F Quick_scope_selective('F')
onoremap <expr> <silent> t Quick_scope_selective('t')
onoremap <expr> <silent> T Quick_scope_selective('T')


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/source_maps/*,*.log,*/link_info/*,*/www-git/*,*/sorbet/*

" autocomplete with dashes plz
set iskeyword+=

set autoindent

set expandtab
set smarttab

" Tabz
set shiftwidth=2
set softtabstop=2
set tabstop=2

set t_Co=256

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

set backspace=2

set number

set ignorecase

set smartcase

" Auto save buffers whenever you lose focus
au FocusLost * silent! wa

" Auto save buffers when you switch context
set autowriteall

"gotta get out
inoremap jk jk
inoremap fd <Esc>

set incsearch

" Highlight things that we find with the search
set hlsearch

set hidden

highlight MatchParen ctermbg=4

" Look and Feel
syntax on
colo jellybeans

set laststatus=2
set encoding=utf-8

autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4

autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set tabstop=2

autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2
autocmd FileType html set tabstop=2

autocmd FileType php set shiftwidth=2
autocmd FileType php set softtabstop=2
autocmd FileType php set tabstop=2

autocmd BufRead,BufNewFile TARGETS set filetype=python
autocmd BufRead,BufNewFile *.rbi set filetype=ruby

" nobody uses ex mode:
nnoremap Q @@


"m equals /[A-Z]<CR> for camel case
onoremap m /[A-Z]<cr>

"u equals t_ for snake case
onoremap u t_

"p equals i(
onoremap p i(

"b equals i[
onoremap b i[

"r equals i{
onoremap r i{

"q equals i"
onoremap q i"

" Y behaves like other capital letters
nnoremap Y y$

"leader"
nnoremap <SPACE> <Nop>
let mapleader =" "

"delete buffer"
nnoremap <c-b> :bd<cr>

"quick fix"
nnoremap <c-n> :cn<cr>

" Mappings
" swap words
map <leader>w dawelp

"swap areas of text
vnoremap <C-X> <Esc>`.``gvP``P

"open next line indent
inoremap <C-R><C-R> <cr><Esc>O

" shift tab!
imap <S-Tab> <C-o><<

" Buffer navigation
nnoremap <silent> <tab> <c-i>
nnoremap <silent> <S-tab> <c-o>

" edit and source .vimrc
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

nnoremap <leader>tgt :set cursorcolumn! cursorline!<CR>

set timeoutlen=500

" Move windows easy
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"************ SMALL SCREEN ************
"set winwidth=100
"set winminwidth=10
"" We have to have a winheight bigger than we want to set winminheight. But if
"" we set winheight to be huge before winminheight, the winminheight set will
"" fail.
"set winheight=5
"set winminheight=5
"set winheight=999

" ****************** SCROLLING *********************

set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15    " Number of cols from horizontal edge to start scrolling
set sidescroll=1        " Number of cols to scroll at a time


inoremap        <C-A> <C-O>^
inoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj

inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <silent> J gJ


" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz
map gg ggzz


nnoremap H ^
nnoremap L $

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;


"gui stuff

if has("gui_running")
  "get rid of the scroll bars in macvim~!
  set guioptions+=LlRrb
  set guioptions-=LlRrb
  "colorscheme hack
  colo jellybeans
  colo smyck
  set relativenumber
  set vb
  set gfn=Monaco:h14
  set guioptions-=T
endif

" relative line numbers toggle
function! NumberToggle()
  set relativenumber!
endfunc

nnoremap <silent> <leader>r :call NumberToggle()<cr>


au BufRead,BufNewFile *.lsh setfiletype lisp
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.coffee.erb setfiletype coffee
autocmd BufNewFile,BufReadPost *.jade set filetype=jade
set autoread


" open on enter
" "autocmd vimenter * NERDTree
" close on exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1


"Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

set listchars=tab:▸\ ,eol:¬

" Jump to css
let g:jumptocss_autoclose = 1
nnoremap ,jc :JumpToCSS<CR>

"no backup and i hate .sw*
set nobackup
set noswapfile

"Clear search
nnoremap <leader>l :nohlsearch<CR><C-l>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"wrap toggling
nnoremap <leader>w :set wrap!<CR>

map <F3> :%s/>\s*</>\r</g<CR>:set ft=xml<CR>ggVG=
map <leader>j :%s/{/{\r/g<CR>:%s/}/\r}/g<CR>:%s/,/,\r/g<CR>:set ft=javascript<CR>ggVG=


nnoremap <leader>s :Gstatus<cr>
nnoremap <leader>co :Gcommit<cr>

nnoremap <silent> R v$hp


func! s:DeleteBuffer()
  exec "bd" fnamemodify(getline('.')[2:], ':p')
  exec "norm \<F5>"
endfunc

nnoremap <C-f> :AckFromSearch<cr>

"nmap <leader>cs :let @*=expand(“%”)
"" Improve vim's scrolling speed
set ttyfast
"set ttyscroll=3
set lazyredraw

nnoremap <silent> <leader>fc :let @+ = expand("%:F")<cr>

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>



vnoremap // y/<C-R>"<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprev<CR>

let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

let g:ale_linters_explicit = 1

" Copy filename to clipboard
map <Leader>c "+y

"coc
"
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"nnoremap <silent> <cr> :call ReplayLastMacro()<cr>

"function! ReplayLastMacro()
  "try
    "normal @@
  "catch /E748/
    "normal @q
  "endtry
"endfunction
"
"go highlight
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_def_mapping_enabled = 0
au BufReadPost,BufNewFile *.go let g:go_def_mapping_enabled = 1 | let g:go_def_mode = 'godef'
nnoremap <C-t> :NERDTreeFind<cr>
nnoremap <C-d> :GoDef<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-y> :History<cr>
nnoremap <leader>d :CocDisable<CR>
nnoremap <c-g> :BCommits<CR>

