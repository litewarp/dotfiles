set nocompatible               " be iMproved
filetype off                   " required!

let need_to_install_plugins=0

if empty(system("grep lazy_load ~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))
  echoerr "Vundle plugins are not installed. Please run ~/.vim/bin/install"
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  Plugin 'morhetz/gruvbox'
  Plugin 'jacoborus/tender.vim'
  Plugin 'phanviet/vim-monokai-pro'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'NLKNguyen/papercolor-theme'

  "Project Navigations
  Plugin 'ctrlpvim/ctrlp.vim'
  "Incremental Highlight
  Plugin 'haya14busa/incsearch.vim'
  " General Editing
  "
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'alvan/vim-closetag'

  Plugin 'scrooloose/nerdcommenter'
  Plugin 'sjl/gundo.vim'
  " Line up text
  Plugin 'godlygeek/tabular'

  " Ruby / Rails
  "
  Plugin 'camelcasemotion'
  Plugin 'nertzy/edit-plus'
  Plugin 'brysgo/quickfixfix'
  Plugin 'regreplop.vim'
  Plugin 'Peeja/insert_mode_background_color'
  Plugin 'vim-scripts/L9'
  Plugin 'Peeja/vim-cdo'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'YankRing.vim'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'tpope/vim-projectionist'
  Plugin 'sbdchd/neoformat'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'dhruvasagar/vim-table-mode'

  " Window Management
  Plugin 'ZoomWin'
  " Searching
  Plugin 'epmatsw/ag.vim'
  Plugin 'tpope/vim-abolish'
  Plugin 'henrik/vim-qargs'
  " Navigation
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'
  " Languages
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'styled-components/vim-styled-components'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'hail2u/vim-css3-syntax'
  Plugin 'neoclide/coc.nvim', {'do': 'coc#util#install()'}
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'Shougo/denite.nvim'
  Plugin 'chr4/nginx.vim'

  Plugin 'plasticboy/vim-markdown'
  Plugin 'slim-template/vim-slim'
  Plugin 'reedes/vim-pencil'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'fatih/vim-go'
  Plugin 'rosstimson/scala-vim-support'
  Plugin 'guns/vim-clojure-static'
  Plugin 'chrisbra/csv.vim'
  Plugin 'elzr/vim-json'
  Plugin 'lambdatoast/elm.vim'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'jparise/vim-graphql'

  " Development Tool Integration
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'pivotal/tmux-config'
  Plugin 'sjl/vitality.vim'
  Plugin 'ryanoasis/vim-devicons'

  call vundle#end()

  filetype plugin indent on

  runtime! init/**.vim

  syntax on

" General Config

set shell=bash
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set cmdheight=2
set laststatus=2
set autowrite
set noshowmode
set timeoutlen=1000
set ttimeoutlen=1000
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set scrolloff=3
set hidden
set inccommand=nosplit
" coc.nvim
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Line numbers
set number
set numberwidth=5

"Highlight search matches
set hlsearch

" Open new split panes to the right and bottom
set splitbelow
set splitright

"user ag over grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

" Autocommands
"

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

if has("autocmd")
  filetype plugin indent on
  "Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss.css

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
endif
endif
