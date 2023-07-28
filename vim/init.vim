if &compatible
  set nocompatible
endif

set number
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set clipboard=unnamedplus

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

let mapleader = ","

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('w0rp/ale')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})

  call dein#add('elixir-lang/vim-elixir')
  call dein#add('elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'})

  call dein#add('mhartington/oceanic-next')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')

  call dein#add('scrooloose/nerdtree')

  call dein#add('editorconfig/editorconfig-vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" -----------------------------------------------------
" Theme
" -----------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext

let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1

" -----------------------------------------------------
" Typing UX
" -----------------------------------------------------
let g:ale_fix_on_save = 1
let g:ale_fixers = { 'elixir': ['mix_format'], 'markdown': ['prettier'] }

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <leader>rename <Plug>(coc-rename)
nmap <silent> <leader>ref <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)

" -----------------------------------------------------
" Directory Tree
" -----------------------------------------------------
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" -----------------------------------------------------
" Syntax
" -----------------------------------------------------
autocmd BufNewFile,BufRead *.slim,*.slime setlocal filetype=slim


if dein#check_install()
  call dein#install()
endif
