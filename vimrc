" Leader
let mapleader = ","
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set iskeyword-=_  " separate words by underscores
" set noesckeys     " Remove delay after esc
set bs=indent,eol,start
set shiftround    " shift on even tabs
set wrap
set linebreak
set nolist
set tw=0
set wrapmargin=0
set formatoptions+=t
set viminfo='100,h

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
"

" Define bundles via Github repos
Bundle 'danro/rename.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'nanki/treetop.vim'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rvm'
Bundle 't9md/vim-ruby-xmpfilter'
" Bundle 'tsaleh/vi-matchit'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/RubySinatra'
" Bundle 'docunext/closetag.vim'
Bundle 'othree/xml.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Keithbsmiley/swift.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'slim-template/vim-slim'
Bundle 'ecomba/vim-ruby-refactoring'
"Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'xenoterracide/html.vim'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/nerdtree'
" Bundle 'Sirupsen/vim-execrus'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'flazz/vim-colorschemes'
"Bundle 'vim-scripts/AutoComplPop'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'SirVer/ultisnips'

" HTML Stuff
Bundle 'rstacruz/sparkup'

"Clojure Stuff
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'

" upgrade to powerline (next version) when it's finished
" Bundle 'Lokaltog/powerline'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on
runtime macros/matchit.vim

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2

" Display extra whitespace
"set list listchars=tab:»·,trail:·

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --noheading\ --nogroup\ --nocolor
endif

" Color scheme
colorscheme monokain
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move up and down virtual lines, not actual lines
nmap k gk
nmap j gj

" Fix insert mode arrow keys outputting letters
imap OA <up>
imap OB <down>
imap OC <right>
imap OD <left>

" Ability to add new lines without moving or entering insert mode
map <S-j> O<Esc>j
map <S-k> o<Esc>k

" Home row mappings
imap jk <ESC>
map <C-h> bdw

" Edit another file in same directory as current file
" map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Other leader mappings
map <leader>t :!rspec<CR>
map <leader>c :!cucumber<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Why is it necessary to hit shift to enter commands?
nnoremap ; :

" Like other applications, quit with q - replaces the macro record key
nnoremap <leader>qq qq
nnoremap <leader>q q
nnoremap <Space> @q
nmap q :q<CR>

" Run files
" map <F5> :w<CR> :!chmod +x %<CR> :!./%<CR>
map <F5> :w<CR> :!bash -c "ruby %:p"<CR>

" Xmpfilter mappings - execute ruby code within vim. requires gem rcodetools
nmap <buffer> <D-m> <Plug>(xmpfilter-mark)
xmap <buffer> <D-m> <Plug>(xmpfilter-mark)
imap <buffer> <D-m> <Plug>(xmpfilter-mark)

nmap <buffer> <D-r> <Plug>(xmpfilter-run)
xmap <buffer> <D-r> <Plug>(xmpfilter-run)
imap <buffer> <D-r> <Plug>(xmpfilter-run)

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal textwidth=80

" Turn spelling on for text files
au BufRead,BufNewFile *.txt setlocal spell

" NERDtree mappings
" autocmd vimenter * if !argc() | NERDTree | endif
" The % make it use the current file's dir
map <C-n> :NERDTreeToggle <CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Remove whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 4 Space tabs in python (so wasteful...)
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" Rainbow Parentheses Stuff
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:sparkupExecuteMapping = '<leader>e'
