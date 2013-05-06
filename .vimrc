" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
  else
  set backup		" keep a backup file
endif

" set dir=~/.vim/tmp
set backupdir=~/.vim/tmp
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set bs=2     " make backspace behave like normal again

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
" set clipboard=unnamed  " Yanks go to clipboard instead.


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a  " on OSX press ALT and click
endif


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader=","  " change the leader to be a comma vs slash


" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256
" color wombat256mod  " wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
color EspressoLibre
" color molokai
" color jellybeans


" Showing line numbers and length
set number  " show line numbers
set colorcolumn=80
" setlocal colorcolumn=+1
" setlocal colorcolumn=
highlight ColorColumn ctermbg=233


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" easier formatting of paragraphs
" Don't use Ex mode, use Q for formatting
map Q gq
vmap Q gq
nmap Q gqap


" Useful settings
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set history=500    " keep 500 lines of command line history


" Real programmers don't use TABs but spaces
set tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab
autocmd FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
autocmd FileType html set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Make search case insensitive
set hlsearch
set noincsearch            " incsearch is annoying
" set ignorecase             " Case insensitive searching
set smartcase              " Unless I really mean case sensitive


" For pathogen.vim: auto load all plugins in .vim/bundle
" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" Open NerdTree
" cd ~/.vim/bundle
" git clone git://github.com/scrooloose/nerdtree.git
let NERDTreeQuitOnOpen = 1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <silent> <leader>n :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_lint_ignore = "E501"
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" '<leader>di' to start DrawIt and '<leader>ds' to stop DrawIt. 
