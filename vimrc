call plug#begin('~/.vim/plugged') 

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }
Plug 'w0ng/vim-hybrid'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/emmet-vim'
Plug 'myhere/vim-nodejs-complete'
call plug#end()

syntax on
"set mouse=a
set nu
set tabstop=2
"set autoindent
set expandtab
set shiftwidth=2
set background=dark
colorscheme hybrid
set backspace=indent,eol,start


:NERDTreeToggle
nmap <Tab> gt
nmap <S-Tab> gT


autocmd BufNewFile,BufRead *.js setlocal ft=javascript
autocmd BufNewFile,BufRead *.ejs setlocal ft=html
autocmd BufNewFile,BufRead *.eex setlocal ft=html
autocmd BufNewFile,BufRead *.py setlocal ft=python
autocmd BufNewFile,BufRead *.rb setlocal ft=ruby
autocmd BufNewFile,BufRead Gemfile setlocal ft=ruby
autocmd BufNewFile,BufRead *.coffee setlocal ft=coffee
autocmd BufNewFile,BufRead *.ts setlocal ft=typescript
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd BufNewFile,BufRead *.jade setlocal ft=markdown
autocmd BufNewFile,BufRead *.gyp setlocal ft=json
autocmd BufNewFile,BufRead *.cson setlocal ft=json
autocmd BufNewFile,BufRead *.yml setlocal ft=yaml
autocmd BufNewFile,BufRead *.yaml setlocal ft=yaml
autocmd BufNewFile,BufRead *.gradle setlocal ft=groovy


" 起動時に有効化
let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplete#sources#syntax#min_keyword_length = 3
" 補完を表示する最小文字数
let g:neocomplete#auto_completion_start_length = 2
" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0
"AutoCmd InsertLeave * silent! pclose!


let g:neocomplete#max_keyword_width = 10000

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.ruby = ['::']

if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.ruby = 'eruby'


if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript

let s:neco_dicts_dir = $HOME . '/dicts'
if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
    \   'ruby': s:neco_dicts_dir . '/ruby.dict',
    \   'javascript': s:neco_dicts_dir . '/jquery.dict',
    \ }
endif
let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

call neocomplete#custom#source('look', 'min_pattern_length', 1)


autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1
