" required for several plugins
set nocompatible

" enable syntax highlighting
syntax on

" don't wrap long lines
set nowrap

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" scroll the window when we get near the edge
set scrolloff=4 sidescrolloff=8

" use 4 spaces for tabs
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set smarttab

" enable line numbers, and don't make them any wider than necessary
set number numberwidth=2

" show the first match as search strings are typed
set incsearch

" highlight the search matches
set hlsearch

" searching is case insensitive when all lowercase
set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
if has ('win32')
    set directory=%TEMP%
    set shellxquote=
endif

" pick up external file modifications
set autoread

" don't abandon buffers when unloading
set hidden

" match indentation of previous line
set autoindent

" perform autoindenting based on filetype plugin
filetype plugin indent on

" don't blink the cursor
set guicursor=a:blinkon0

" show current line info (current/total)
set ruler rulerformat=%=%l/%L

" show status line
set laststatus=2

" augment status line
function! ETry(function, ...)
    if exists('*'.a:function)
        return call(a:function, a:000)
    else
        return ''
    endif
endfunction
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" When lines are cropped at the screen bottom, show as much as possible
set display=lastline

" flip the default split directions to sane ones
set splitright
set splitbelow

" make backspace work in insert mode
set backspace=indent,eol,start

" highlight trailing whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" use tab-complete to see a list of possiblities when entering commands
set wildmode=list:longest,full

" allow lots of tabs
set tabpagemax=20

" disable all alerts
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has ('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" No backup
set nobackup
set nowb
set noswapfile
set si "smart indent

" global variables
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" JSON is JS
au BufNewFile,BufRead *.json set ai filetype=javascript

" rpsec syntax
au BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" CSS3 vendor prefix highlight
highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

" vim:ft=vim:
