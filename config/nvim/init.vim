" =========================================================================
" .vimrc for Jeff Jewiss
" =========================================================================

let s:darwin = has('mac')

" =========================================================================
" Vim Plug-ins
" =========================================================================

silent! if plug#begin('~/.config/nvim/plugged')

if s:darwin
  let g:plug_url_format = 'git@github.com:%s.git'
else
  let $GIT_SSL_NO_VERIFY = 'true'
endif


" Selected plugins
Plug 'alexlafroscia/vim-ember-cli'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'jszakmeister/vim-togglecursor'
Plug 'jceb/vim-orgmode'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mattn/calendar-vim'
Plug 'radenling/vim-dispatch-neovim'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'severin-lemaignan/vim-minimap'
Plug 'shougo/unite.vim'
Plug 'sjl/gundo.vim'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-session'

" Color
Plug 'KeitaNakamura/neodark.vim'
Plug 'flazz/vim-colorschemes'

" Syntax
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Quramy/tsuquyomi' " Typescript IDE features
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'ap/vim-css-color'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'gregsexton/gitv'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-dispatch'

" Writing
Plug 'dbmrq/vim-ditto'
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
let maplocalleader=" "
set nocompatible " Make vim more useful
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
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
set noshowmode " Don't show the current mode.
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
if !has('gui_running')
  set t_Co=256
endif
set background=dark
set termguicolors
syntax on
silent! colorscheme onedark

" Local dirs
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo

" Open a file or url
noremap <Leader>o :!open <cfile><CR>

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

" < h> | Clear last search highlight
noremap <Leader>h :noh<CR>

" < w> | Write file
noremap <Leader>w :w<CR>

" < W> | Sudo write
noremap <Leader>W :w !sudo tee %<CR>

" < qq> | Close Quickfix window
map <Leader>qq :cclose<CR>

" < c> | Toggle show tabs and trailing spaces
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <Leader>c :set nolist!<CR>

" < mp> | Preview current markdown file (GitHub Flavored)
nnoremap <Leader>mp :!vmd %:p<CR>
" <F7> | Gundo.vim
inoremap <F7> <ESC>:GundoToggle<CR>
nnoremap <F7> :GundoToggle<CR>

" <F8> | Tagbar.vim
inoremap <F8> <ESC>:TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

" <F9> | Minimap.vim
inoremap <F9> <esc>:MinimapToggle<CR>
nnoremap <F9> :MinimapToggle<CR>

" Autocomplete
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" FZF
nmap ; :Buffers<CR>
nmap <c-p> :Files<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>

noremap <Leader>s :Ag<CR>
noremap <Leader>S :Ag!<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }



" <F2> | NERDTree mappings
inoremap <F2> <esc>:NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" NERDTree settings
let NERDTreeShowHidden=1

" NerdCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

" Terminal-mode settings
tnoremap <Leader><Esc> <C-\><C-n> " Space Escape to exit
nnoremap <Leader>tv :vsp term://zsh<CR>
nnoremap <Leader>ts :sp term://zsh<CR>

" Lightline settings
let g:lightline = {
\ 'colorscheme': 'neodark',
\ 'active': {
\   'left': [['mode', 'paste'], ['readonly', 'relativepath']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Writing related settings
" soft wrap text in markdown files to the window size
" hard wrap text to 80 characters using Visual mode and then 'gq'
if has("autocmd")

  " Turn on spell checking for markdown files
  autocmd BufRead,BufNewFile *.md,*.markdown,*.txt setlocal spell
  autocmd FileType markdown,text,tex setlocal spell
  autocmd FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

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

" Gist.vim
let g:gist_post_private = 1

" <,G> | Goyo.vim
nnoremap <Leader>G :Goyo<CR>
nnoremap <Leader>P :Goyo<CR>

" <,l> | Limelight.vim (enable)
nnoremap <Leader>l :Limelight<CR>

" <,L> | Limelight.vim (disable)
nnoremap <Leader>L :Limelight!<CR>

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
  if exists('$TMUX')
    silent !tmux set status on
  endif
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
nnoremap <Leader>gb :Gblame<CR>

" ----------------------------------------------------------------------------
" Hub (GitHub)
" ----------------------------------------------------------------------------
nnoremap <Leader>gpr :Dis hub pull-request<CR>

" ----------------------------------------------------------------------------
" GHI
" ----------------------------------------------------------------------------
nnoremap <Leader>gi :Dis ghi list<CR>
nnoremap <Leader>gig :Dis ghi list -g<CR>
nnoremap <Leader>giga :Dis ghi list --mine -g<CR>
nnoremap <Leader>gim :Dis ghi list --mine<CR>
nnoremap <Leader>gip :Dis ghi list --mine -p<CR>

" ----------------------------------------------------------------------------
" vim-lexical
" ----------------------------------------------------------------------------
let g:lexical#spell_key = '<leader>s'
let g:lexical#spelllang = ['en_ca','en_us']
let g:lexical#dictionary_key = '<leader>k'
let g:lexical#thesaurus_key = '<leader>t'

" ----------------------------------------------------------------------------
" vim-ditto
" ----------------------------------------------------------------------------
nnoremap <leader>di :ToggleDitto<CR> " Turn it on and off

nmap =d :DittoNext                   " Jump to the next word
nmap -d :DittoPrev                   " Jump to the previous word
nmap +d :DittoGood                   " Ignore the word under the cursor
nmap _d :DittoBad                    " Stop ignoring the word under the cursor
nmap ]d :DittoMore                   " Show the next matches
nmap [d :DittoLess                   " Show the previous matches

" ----------------------------------------------------------------------------
" vim-notes
" ----------------------------------------------------------------------------
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.md'
let g:notes_title_sync = 'change_title'

" ----------------------------------------------------------------------------
" goyo
" ----------------------------------------------------------------------------
let g:goyo_width = 100

" ----------------------------------------------------------------------------
" Easy Align
" ----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
let g:ale_linters = {
        \ 'html': ['ember-template-lint', 'htmlhint'],
        \ 'css': ['stylelint'],
        \ 'javascript': ['eslint'],
        \ 'swift': ['swiftlint'],
        \}
let g:ale_fixers = {
        \ 'javascript': ['eslint'],
        \ 'swift': ['swiftformat'],
        \}

nmap <Leader>af <Plug>(ale_fix)

" ----------------------------------------------------------------------------
" Editor Config
" ----------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" ----------------------------------------------------------------------------
" CSS Color
" ----------------------------------------------------------------------------
nnoremap <Leader>css :call css_color#toggle()<CR>

" ----------------------------------------------------------------------------
" Dash.vim
" ----------------------------------------------------------------------------
:nmap <silent> <Leader>d <Plug>DashSearch
