" =========================================================================
" .vimrc for Jeff Jewiss
" =========================================================================

let s:darwin = has('mac')
let s:ag     = executable('ag')

" =========================================================================
" Vim Plug-ins
" =========================================================================

silent! if plug#begin('~/.vim/plugged')

if s:darwin
  let g:plug_url_format = 'git@github.com:%s.git'
else
  let $GIT_SSL_NO_VERIFY = 'true'
endif


" Selected plugins
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'jszakmeister/vim-togglecursor'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/unite.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-session'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'slim-template/vim-slim',    { 'for': 'slim' }
Plug 'tpope/vim-markdown',        { 'for': 'markdown' }
Plug 'vim-scripts/jade.vim',      { 'for': 'jade' }
Plug 'wavded/vim-stylus',         { 'for': 'stylus' }

" Themes & Colours
Plug 'reedes/vim-thematic'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'reedes/vim-colors-pencil'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-dispatch'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'

call plug#end()
endif


" =========================================================================
" Basic Settings
" =========================================================================

let mapleader=" "
set nocompatible " Make vim more useful
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
set mouse=a " Enable moouse in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set runtimepath^=~/.vim/bundle/ctrlp.vim " Use ctrlp fuzzy file search
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=4 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=4 " Tab key results in 4 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set tags+=.git/tags;~ " Search for tags in the git folder and then up.
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js,*.pyc
set wildignore+=*/smarty/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file

" General Settings
set shell=/bin/zsh

" Set syntax highlighting and colour options.
set t_Co=256
set background=dark
syntax on
"let g:seoul256_background = 233
silent! colorscheme seoul256

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Open a file or url
noremap ,o :!open <cfile><CR>

" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" <,h> | Clear last search highlight
noremap <leader>h :noh<CR>

" <,w> | Write file
noremap <leader>w :w<CR>

" <,W> | Sudo write
noremap <leader>W :w !sudo tee %<CR>

" <,bs> | Prompt for buffer to select
nnoremap <leader>bs :CtrlPBuffer<CR>

" <,qq> | Close Quickfix window
map <leader>qq :cclose<CR>

" <,c> | Toggle show tabs and trailing spaces
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" <,mp> | Preview current markdown file (GitHub Flavored)
nnoremap <leader>mp :!vmd %:p<CR>

" <F8> | Tagbar.vim
if v:version >= 703
  inoremap <F8> <esc>:TagbarToggle<cr>
  nnoremap <F8> :TagbarToggle<cr>
  let g:tagbar_sort = 0
endif

" <C-p> | Ctrl-P.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_jump_to_buffer = 'Et' " Jump to tab AND buffer if already open
let g:ctrlp_open_new_file = 't' " Open newly created files in a new tab
let g:ctrlp_open_multiple_files = 't' " Open multiple files in new tabs
let g:ctrlp_show_hidden = 1 " Index hidden files
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" <F2> | NERDTree mappings
inoremap <F2> <esc>:NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" NERDTree settings
let NERDTreeShowHidden=1

" Writing related settings
" soft wrap text in markdown files to the window size
" hard wrap text to 80 characters using Visual mode and then 'gq'
if has("autocmd")

  " Turn on spell checking for markdown files
  autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
  autocmd FileType markdown setlocal spell

  " Turn on word completion to use kspell
  set complete+=kspell

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html setlocal wrap linebreak nolist textwidth=80 formatoptions=1

  " Enable smart quotes
  augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call textobj#quote#init({'educate': 1}) |
                                \ call lexical#init({'spell': 1})
    autocmd FileType textile call textobj#quote#init({'educate': 1}) |
                           \ call lexical#init({'spell': 1})
    autocmd FileType text call textobj#quote#init({'educate': 1}) |
                        \ call lexical#init({'spell': 1})
  augroup END
endif

" Session.vim
let g:session_autosave = 'no'

" Airline.vim
let g:airline_powerline_fonts = 0
let g:airline_theme = 'luna'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tmuxline#enabled = 0

" Gist.vim
let g:gist_post_private = 1

" <, > | Goyo.vim
nnoremap <Leader><Space> :Goyo<CR>

" <,f> | Limelight.vim (enable)
nnoremap <Leader>f :Limelight<CR>

" <,F> | Limelight.vim (disable)
nnoremap <Leader>F :Limelight!<CR>

function! s:goyo_before()
  if has('gui_running')
    set fullscreen
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  set noshowmode
  set noshowcmd
  set nocursorline
  set wrap
  set linebreak
  set scrolloff=999
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_after()
  silent !tmux set status on
  set showmode
  set showcmd
  set cursorline
  set nowrap
  set nolinebreak
  set scrolloff=3
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]

" -------------------------------------------------------------------------
" Markdown headings
" -------------------------------------------------------------------------
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

" -------------------------------------------------------------------------
" <leader>t | vim-tbone
" -------------------------------------------------------------------------
function! s:tmux_send(dest) range
  call inputsave()
  let dest = empty(a:dest) ? input('To which pane? ') : a:dest
  call inputrestore()
  silent call tbone#write_command(0, a:firstline, a:lastline, 1, dest)
endfunction
nnoremap <silent> <leader>tt :call <SID>tmux_send('')<cr>
nnoremap <silent> <leader>t1 :call <SID>tmux_send('.1')<cr>
nnoremap <silent> <leader>t2 :call <SID>tmux_send('.2')<cr>
xnoremap <silent> <leader>tt :call <SID>tmux_send('')<cr>gv
xnoremap <silent> <leader>t1 :call <SID>tmux_send('.1')<cr>gv
xnoremap <silent> <leader>t2 :call <SID>tmux_send('.2')<cr>gv

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpull<CR>
nnoremap <Leader>gu :Gpush<CR>

" ----------------------------------------------------------------------------
" vim-lexical
" ----------------------------------------------------------------------------
let g:lexical#spell_key = '<leader>s'
let g:lexical#spelllang = ['en_us','en_ca',]
let g:lexical#thesaurus_key = '<leader>t'

" ----------------------------------------------------------------------------
" vim-notes
" ----------------------------------------------------------------------------
let g:notes_directories = ['~/Dropbox/Documents/Writing/Notes']
let g:notes_suffix = '.md'
let g:notes_title_sync = 'change_title'
