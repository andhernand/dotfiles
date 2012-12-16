" Plugins are managed by Vundle. Once VIM is open run :BundleInstall to
" install plugins.

" Plugins requiring no additional configuration or keymaps
Bundle "git://github.com/vim-scripts/Colour-Sampler-Pack.git"
Bundle "git://github.com/tpope/vim-git.git"
Bundle "git://github.com/harleypig/vcscommand.vim.git"
Bundle "git://github.com/altercation/vim-colors-solarized.git"
Bundle "git://github.com/pangloss/vim-javascript.git"
Bundle "git://github.com/vim-scripts/L9.git"
Bundle "git://github.com/tpope/vim-rake.git"
Bundle "git://github.com/vim-ruby/vim-ruby.git"
Bundle "git://github.com/ervandew/supertab.git"
Bundle "git://github.com/tomtom/tcomment_vim.git"
Bundle "git://github.com/michaeljsmith/vim-indent-object.git"
Bundle "git://github.com/tsaleh/vim-matchit.git"
Bundle "git://github.com/kana/vim-textobj-user.git"
Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
Bundle "git://github.com/tpope/vim-repeat.git"
Bundle "git://github.com/vim-scripts/ruby-matchit.git"
Bundle "git://github.com/hail2u/vim-css3-syntax.git"
Bundle "git://github.com/skammer/vim-css-color.git"

" Typescript
Bundle "git://github.com/leafgarland/typescript-vim.git"
au BufNewFile,BufRead *.ts set filetype=typescript

" Powershell
Bundle "git://github.com/PProvost/vim-ps1.git"
au BufNewFile,BufRead *.ps1,*.psd1,*.psm1 set filetype=ps1
au BufNewFile,BufRead *.ps1xml set filetype=ps1xml

" Less
Bundle "git://github.com/groenewege/vim-less.git"
au BufNewFile,BufRead *.less set filetype=less

" Coffee script
Bundle "git://github.com/kchmck/vim-coffee-script.git"
au BufNewFile,BufRead *.coffee set filetype=coffee

" ACK
Bundle "git://github.com/mileszs/ack.vim.git"
nmap g/ :Ack!<space>
nmap g* :Ack! -w <C-R><C-W><space>
nmap ga :AckAdd!<space>
nmap gn :cnext<CR>
nmap gp :cprev<CR>
nmap gq :ccl<CR>
nmap gl :cwindow<CR>

" Tagbar for navigation by tags using CTags
Bundle "git://github.com/majutsushi/tagbar.git"
let g:tagbar_autofocus = 1
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
Bundle "git://github.com/tpope/vim-markdown.git"
augroup mkd
    autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
augroup END

" NERDTree for project drawer
Bundle "git://github.com/scrooloose/nerdtree.git"
let NERDTreeHijackNetrw = 0

nmap gt :NERDTreeToggle<CR>
nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

" Tabular for aligning text
Bundle "git://github.com/godlygeek/tabular.git"
function! CustomTabularPatterns()
    if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
    endif
endfunction

autocmd VimEnter * call CustomTabularPatterns()

" shortcut to align text with Tabular
map <Leader>a :Tabularize<space>

" Fuzzy finder for quickling opening files / buffers
Bundle "git://github.com/clones/vim-fuzzyfinder.git"
let g:fuf_coveragefile_prompt = '>GoToFile[]>'
let g:fuf_coveragefile_exclude = '\v\~$|' .
            \                                '\.(o|exe|dll|bak|swp|log|sqlite3|png|gif|jpg)$|' .
            \                                '(^|[/\\])\.(hg|git|bzr|bundle)($|[/\\])|' .
            \                                '(^|[/\\])(log|tmp|vendor|system|doc|coverage|build|generated|node_modules)($|[/\\])'

let g:fuf_keyOpenTabpage = '<D-CR>'

nmap <Leader>t :FufCoverageFile<CR>
nmap <Leader>b :FufBuffer<CR>
nmap <Leader>f :FufRenewCache<CR>
nmap <Leader>T :FufTagWithCursorWord!<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
Bundle "git://github.com/tpope/vim-unimpaired.git"
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Syntastic for catching syntax errors on save
Bundle "git://github.com/scrooloose/syntastic.git"
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_disabled_filetypes = ['sass']

" gundo for awesome undo tree visualization
Bundle "git://github.com/sjl/gundo.vim.git"
map <Leader>h :GundoToggle<CR>

" rails.vim, nuff' said
Bundle "git://github.com/tpope/vim-rails.git"
map <Leader>oc :Rcontroller<Space>
map <Leader>ov :Rview<Space>
map <Leader>om :Rmodel<Space>
map <Leader>oh :Rhelper<Space>
map <Leader>oj :Rjavascript<Space>
map <Leader>os :Rstylesheet<Space>
map <Leader>oi :Rintegration<Space>

" surround for adding surround 'physics'
Bundle "git://github.com/tpope/vim-surround.git"
" # to surround with ruby string interpolation
let g:surround_35 = "#{\r}"
" - to surround with no-output erb tag
let g:surround_45 = "<% \r %>"
" = to surround with output erb tag
let g:surround_61 = "<%= \r %>"

" vim:ft=vim:
