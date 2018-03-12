" File              : .vimrc
" Author            : hargathor <You@email>
" Date              : 10.11.2017
" Last Modified Date: 10.11.2017
" Last Modified By  : hargathor <You@email>
set nocompatible
set t_Co=256
set bg=dark

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'ervandew/supertab'
" the framework
Plug 'roxma/nvim-completion-manager'
" Requires vim8 with has('python') or has('python3')
" Requires the installation of msgpack-python. (pip install msgpack-python)
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tomlion/vim-solidity'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'
Plug 'Townk/vim-autoclose'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'jtratner/vim-flavored-markdown'

Plug 'rust-lang/rust.vim' 

Plug 'maksimr/vim-jsbeautify'
Plug 'w0rp/ale'

Plug 'alpertuna/vim-header'

Plug 'cespare/vim-toml'

Plug 'fisadev/vim-isort'

Plug 'leafgarland/typescript-vim'

Plug 'tell-k/vim-autopep8'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Show linenumbers
set number
set ruler
filetype plugin on
filetype plugin indent on
syntax on
" Keep cursor vertically centered
augroup VCenterCursor
    au!
    au BufEnter,WinEnter,WinNew,VimResized *,*.*
                \ let &scrolloff=winheight(win_getid())/2
augroup END
" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
" set mouse=a
"Remap page moves
"Avoid scrolling one line by one line
noremap <C-J> }
noremap <C-K> {
" set cursorline

" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" NerdTree"
" autocmd vimenter * NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim Airline"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ALE Configuration "
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" linter for rust
let g:ale_linters = {'rust': ['cargo']}
let g:ale_linters = {'xml': ['xmllint']}

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
            \   'javascript': ['eslint'],
            \   'rust': ['rustfmt'],
            \   'python': ['autopep8'],
            \}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Enable completion where available.
let g:ale_completion_enabled = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" AddHeader configuration
let g:header_auto_add_header = 0
let g:header_field_author = 'hargathor'
let g:header_field_author_email = '3949704+hargathor@users.noreply.github.com'

" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" TagBar configuration
let g:tagbar_autofocus = 0
let g:tagbar_type_rust = {
            \ 'ctagstype' : 'rust',
            \ 'kinds' : [
            \'T:types,type definitions',
            \'f:functions,function definitions',
            \'g:enum,enumeration names',
            \'s:structure names',
            \'m:modules,module names',
            \'c:consts,static constants',
            \'t:traits',
            \'i:impls,trait implementations',
            \]
            \}

let g:tagbar_type_make = {
            \ 'kinds':[
            \ 'm:macros',
            \ 't:targets'
            \ ]
            \}

let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }

let g:tagbar_type_typescript = {                                                  
            \ 'ctagsbin' : 'tstags',                                                        
            \ 'ctagsargs' : '-f-',                                                           
            \ 'kinds': [                                                                     
            \ 'e:enums:0:1',                                                               
            \ 'f:function:0:1',                                                            
            \ 't:typealias:0:1',                                                           
            \ 'M:Module:0:1',                                                              
            \ 'I:import:0:1',                                                              
            \ 'i:interface:0:1',                                                           
            \ 'C:class:0:1',                                                               
            \ 'm:method:0:1',                                                              
            \ 'p:property:0:1',                                                            
            \ 'v:variable:0:1',                                                            
            \ 'c:const:0:1',                                                              
            \ ],                                                                            
            \ 'sort' : 0                                                                    
            \ } 

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" The above command will change the 'completeopt' option so that Vim's popup
" menu doesn't select the first completion item, but rather just inserts the
" longest common text of all matches; and the menu will come up even if
" there's only one match. (The longest setting is responsible for the former
" effect and the menuone is responsible for the latter
set completeopt=longest,menuone


"Snippets
"UltiSnips is the snippet framework
"Tons of default snippets provided by vim-snippets
"Disable the traditional expand key
"Use a function instead, triggered on enter when completion window is open
"I do so because I use the enter key as my expand key
"and this prevent a bug which makes the key useless otherwise
"Not necessary to remap jump forward/backward as it is
"done on the autocompletion framework
"let g:UltiSnipsJumpForwardTrigger=\"<tab>"
"let g:UltiSnipsJumpBackwardTrigger=\"<S-tab>"
"TODO: Disable default snippets for some languages
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res=0
function! <SID>ExpandSnippetOrReturn()
  let snippet=UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ?
      \"<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"


"Ale colors
"Ale is the syntax processing framework
"Intrusive colors
hi clear ALEErrorSign
hi clear ALEWarningSign
hi ALEErrorSign guifg=Red
hi ALEWarningSign guifg=Orange

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
