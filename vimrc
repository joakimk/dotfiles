set nocompatible    " Don't sacrifice anything for Vi compatibility.
set encoding=utf-8  " In case $LANG doesn't have a sensible value.

" pathogem.vim lets us keep plugins etc in their own folders under ~/.vim/bundle.
" http://www.vim.org/scripts/script.php?script_id=2332
" filetype off and then on again afterwards for ftdetect files to work properly.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on  " Load plugin and indent settings for the detected filetype.
syntax on                  " Syntax highlighting.
set t_Co=256
color jellybeans+          " Default color scheme.
set number                 " Show gutter with line numbers.
set ruler                  " Show line, column and scroll info in status line.
set laststatus=2           " Always show status bar.
set modelines=1            " Use modeline overrides.
set showcmd                " Show partially typed command sequences.
set scrolloff=3            " Minimal number of lines to always show above/below the caret.

set wrap  " Soft wrap.
" Would use lbr for nicer linebreaks, but can't combine with listchars.

" 2 spaces indent.
set softtabstop=2
set shiftwidth=2
set expandtab

" Autoindent with =
set autoindent

" Show invisibles.
set listchars=nbsp:·,tab:▸\ ,trail:·
set list!

" Highlight current line
" Makes vip take 100% and slow down in some files.
"set cursorline

" No pipes in vertical split separators.
set fillchars=vert:\

" Diff colors
" Dark red
hi DiffText term=reverse cterm=bold ctermbg=88
" Dark blue
hi DiffChange term=bold ctermbg=17
" Dark gray, lighter gray
hi DiffDelete term=bold ctermbg=234 ctermfg=235
" Dark green
hi DiffAdd term=bold ctermbg=22

" Searching.
set hlsearch    " Highlight results.
set incsearch   " Search-as-you-type.

" Case insensitve search/replace is not productive
"set ignorecase  " Case-insensitive…
"set smartcase   " …unless phrase includes uppercase.

set gdefault    " Global search by default; /g for first-per-row only.

set nojoinspaces                " 1 space, not 2, when joining sentences.
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.

" Don't break words when wrapping
set nolist
set lbr

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']

" Command-T configuration
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1

" Ctrl-P
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 0

" Ignores for elixir projects
" ctrlp does not seem to respect wildignore for this?
let g:ctrlp_custom_ignore = '\v[\/](deps|_build|node_modules|priv\/static|web\/static\/vendor\/compiled_elm/)$'

" Don't let ctrlp change the working directory. Instead it now uses
" the directory where vim was started. This fixes issues with some
" projects that has nested git directories.
let g:ctrlp_working_path_mode = 0

" Files to skip.
set wildignore+=*.o,*.obj,.git,tmp
set wildignore+=public/uploads,db/sphinx,vim/backup
set wildignore+=public/uploads
set wildignore+=tmp/
set wildignore+=data/

" Workaround 'E854: path too long for completion' for now
" http://stackoverflow.com/questions/9590658/vim-e854-path-too-long-for-completion
set complete-=i

" Reload files changed outside the editor (for example by switching git branch)
" If a file is changed in two editors, but then only saved in one it will
" still generate a warning.
set autoread

" Automatically save changes before switching buffer with some
" commands, like :cnfile.
set autowrite

" Make terminal Vim trigger autoread more often.
au WinEnter,BufWinEnter,CursorHold * checktime

" 'Edit anyway' if swap file exists.
au SwapExists * let v:swapchoice = 'e'

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remember last location in file, but not for commit messages.
if has("autocmd")
  au BufReadPost * if &filetype !~ 'commit\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

if !exists("*s:setupWrapping")
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=72
  endfunction
endif

if !exists("*s:setupMarkup")
  function s:setupMarkup()
    "call s:setupWrapping()
    map <buffer> <Leader>p :Mm <CR>
  endfunction
endif

" OS X only due to use of `open`. Adapted from
" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
" Uses John Gruber's URL regexp: http://daringfireball.net/2010/07/improved_regex_for_matching_urls
if has("ruby")
ruby << EOF
  def open_uri
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line
    urls = line.scan(re).flatten

    if urls.empty?
      VIM::message("No URI found in line.")
    else
      system("open", *urls)
      VIM::message(urls.join(" and "))
    end
  end
EOF
endif

if !exists("*OpenURI")
  function! OpenURI()
    :ruby open_uri
  endfunction
endif

if has("autocmd")
  " make and python use real tabs
  au FileType make                                     set noexpandtab
  au FileType python                                   set noexpandtab

  " Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,VagrantFile,Guardfile} set ft=ruby

  " Javascript
  au BufRead,BufNewFile {*.json} set ft=javascript

  " Javascript haml templates
  au BufRead,BufNewFile {*.jst.hamlc} set ft=haml

  " md, markdown, and mk are markdown and define buffer-local preview
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

  " arduino source files
  au BufRead,BufNewFile {*.pde} set ft=cpp

  " Uncomment to have txt files hard-wrap automatically.
  "au BufRead,BufNewFile *.txt call s:setupWrapping()
endif

" Hit S in command mode to save, as :w<CR> is a mouthful and MacVim
" Command-S is a bad habit when using terminal Vim.
" We overload a command, but use 'cc' instead anyway.
noremap S :w<CR>

" Make Y consistent with C and D - yank to end of line, not full line.
nnoremap Y y$

" Map Q to something useful (e.g. QQ to hard-break current line).
" Otherwise Q enters the twilight zone of the 'Ex' mode.
noremap Q gq

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Move by screen lines instead of file lines.
" http://vim.wikia.com/wiki/Moving_by_screen_lines_instead_of_file_lines
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj

" Seriously, why isn't this set by default
cmap WQ wq
cmap Wq wq
"cmap W w
"cmap Q q

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Tab/shift-tab to indent/outdent in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Leader
let mapleader = ","

" Un-highlight search matches
nnoremap <leader><leader> :noh<CR>

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>" Reveal current file

" Open URL from this line (OS X only).
map <leader>u :call OpenURI()<CR>

" Ack/Quickfix windows
map <leader>q :cclose<CR>
map - :cprev<CR> :norm! zz<CR>" Previous fix and center line.
map + :cnext<CR> :norm! zz<CR>" Next fix and center line.

" Center line in previous/next file.
map g- :cpfile<CR> zz
map g+ :cnfile<CR> zz
map g= :cnfile<CR> zz

" Reload vim config
map <Leader>r :source $MYVIMRC<CR>

" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vsp<CR>
nmap <leader><right>  :rightbelow vsp<CR>
nmap <leader><up>     :leftabove  sp<CR>
nmap <leader><down>   :rightbelow sp<CR>

" Get rid of all NERDCommenter mappings except one.
let g:NERDCreateDefaultMappings=0
map <leader>c <Plug>NERDCommenterToggle

" Use nearest split and not a new one
let g:VimuxUseNearestPane = 1

" Remap turbux to not collide with ctrlp
let g:no_turbux_mappings = 1

map <leader>m <Plug>SendTestToTmux

map <leader>M <Plug>SendFocusedTestToTmux

" Support command-t style shortcuts for a while
map <leader>t :CtrlP<CR>

" Trying out different mappings, can't get used to henriks <leader><shift>m thing.
map <leader>l <Plug>SendFocusedTestToTmux
map m <Plug>SendFocusedTestToTmux
map M <Plug>SendTestToTmux

" Control rubymotion from vim
map <Leader>q :call VimuxInterruptRunner()<CR>
map <Leader>w :call VimuxRunCommand("clear; rake simulator")<CR>
map <Leader>e :call VimuxRunCommand("clear; rake device")<CR>

" Map ctrl-s to save
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

" Run default task with "§" (usually runs all tests)
if filereadable("mix.exs")
  map § :call VimuxRunCommand("mix test")<CR>
else
  map § :call VimuxRunCommand("rake")<CR>
endif

" Stop commands with <leader>§
map <leader>§ :call VimuxInterruptRunner()<CR>

" GitGrep mapped to ,a
" http://henrik.nyh.se/2012/07/project-wide-search-and-replace-in-vim-with-qdo/
exe "nnoremap <leader>a :GitGrep "
exe "nnoremap <leader>d :Qdo "

" Be able to run some code to decide how to run a spec (with or without drb, etc)
let g:turbux_command_rspec = 'script/test'

" Fixes arrow keys when used within tmux
if &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" Support .slimbars (handlebars templates using slim)
autocmd BufNewFile,BufRead *.slimbars set filetype=slimbars
autocmd FileType slimbars set tabstop=2|set shiftwidth=2|set expandtab

" Turn RSpec 'should' into the new 'expect' style.
" Also turns 'should ==' into 'expect(…).to eq'.
" The command acts on the current line or in a given range (e.g. visual range).

function! s:ShouldToExpect()
  .s/^\(\s\+\)\(.\+\)\.should\>/\1expect(\2).to/e
  .s/^\(\s\+\)\(.\+\)\.should_not\>/\1expect(\2).not_to/e
  .s/\(expect(.\+)\.\(to\|not_to\)\) ==/\1 eq/e
endfunction

command! -range Expect execute '<line1>,<line2>call <SID>ShouldToExpect()'

" Experimental use of external commands for automating some dev tasks
"
" Example
"   :Dev gen app/models/train.rb
"
function! s:Dev(args)
    " Hardcoded until it needs to be autodetected or specified
    let language = "ruby"

    " NOTE: Hardcoded erlang path for now (the script is implemented in elixir)
    silent execute "!PATH=$PATH:~/dependencies/erlang/bin /Users/jocke/Projects/shared/devtools/devtools " . language . " " . a:args
    execute ":CtrlPClearCache"
    exec "redraw!"
endfunction

command! -nargs=* -complete=file Dev call s:Dev(<q-args>)
