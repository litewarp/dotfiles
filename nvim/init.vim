set nocompatible               " be iMproved
filetype off                   " required!

let need_to_install_plugins=0

if empty(system("grep lazy_load ~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))
  echoerr "Vundle plugins are not installed. Please run ~/.vim/bin/install"
else
  set rtp+=~/.config/nvim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  " UI
  Plugin 'morhetz/gruvbox'
  Plugin 'rakr/vim-one'
  Plugin 'phanviet/vim-monokai-pro' " Currently selected
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  "Project Navigations
  Plugin 'ctrlpvim/ctrlp.vim'
  "File Navigations
  Plugin 'vim-scripts/matchit.zip'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'kshenoy/vim-signature'
  Plugin 'haya14busa/incsearch.vim'

  "
  " General Editing
  "
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'kana/vim-textobj-user'

  Plugin 'scrooloose/nerdcommenter'
  Plugin 'Julian/vim-textobj-variable-segment'
  Plugin 'kana/vim-textobj-line'
  Plugin 'thinca/vim-textobj-between'
  Plugin 'sjl/gundo.vim'
  Plugin 'godlygeek/tabular'

  " Ruby / Rails
  "
  Plugin 'tpope/vim-rails'
  Plugin 'ecomba/vim-ruby-refactoring'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'jgdavey/vim-blockle'
  Plugin 'tpope/vim-rbenv'
  Plugin 'tpope/vim-rake'

  Plugin 'ervandew/supertab'
  Plugin 'nertzy/j-split'

  Plugin 'matt-royal/diffthese'
  Plugin 'camelcasemotion'
  Plugin 'nertzy/edit-plus'
  Plugin 'brysgo/quickfixfix'
  Plugin 'regreplop.vim'
  Plugin 'Peeja/insert_mode_background_color'
  Plugin 'vim-scripts/L9'
  Plugin 'Peeja/vim-cdo'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'YankRing.vim'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'tpope/vim-projectionist'
  Plugin 'kien/rainbow_parentheses.vim'
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
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-haml'
  Plugin 'tpope/vim-cucumber'
  Plugin 'quentindecock/vim-cucumber-align-pipes'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'peitalin/vim-jsx-typescript'
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'mhartington/nvim-typescript',     { 'do': './install.sh' }
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'Shougo/denite.nvim'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'slim-template/vim-slim'
  Plugin 'reedes/vim-pencil'
  Plugin 'nono/vim-handlebars'
  Plugin 'juvenn/mustache.vim'
  Plugin 'w0rp/ale'
  Plugin 'fatih/vim-go'
  Plugin 'rosstimson/scala-vim-support'
  Plugin 'guns/vim-clojure-static'
  Plugin 'chrisbra/csv.vim'
  Plugin 'elzr/vim-json'
  Plugin 'lambdatoast/elm.vim'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'digitaltoad/vim-pug'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'luan/vim-concourse'
  " Development Tool Integration
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'pivotal/tmux-config'
  Plugin 'tpope/vim-dispatch'
  Plugin 'carlobaldassi/ConqueTerm'
  Plugin 'sjl/vitality.vim'
  Plugin 'brysgo/test_server'
  Plugin 'mdelillo/vim-simple-bdd'
  Plugin 'ryanoasis/vim-devicons'

  call vundle#end()

  filetype plugin indent on

  runtime! init/**.vim

  syntax on

" General Config

set shell=zsh
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
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

if has("autocmd")
  filetype plugin indent on


  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss.css

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

endif
endif
