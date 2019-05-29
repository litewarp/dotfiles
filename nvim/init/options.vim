set encoding=UTF-8
scriptencoding utf-8

set guioptions-=e               " Use text tab bar, not GUI
set guioptions-=rL              " Remove scrollbars
set mouse=a                     " Use mouse support in XTerm/iTerm.
set number                      " Line numbers
set backspace=indent,eol,start " Let backspace work over anything.
set list                        " Show whitespace
set listchars=trail:·

let g:sql_type_default="postgresql"

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup=1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 1

let g:yankring_replace_n_pkey = '<C-Tab>'
let g:yankring_replace_n_nkey = '<C-S-Tab>'
let g:yankring_history_file = '.vim_yankring_history'
let g:javascript_plugin_flow = 1

let g:blockle_mapping = '<leader>B'
" Add tmux's higher F-key capabilities
if &term == "screen-256color"
  set t_F3=[25~
  set t_F4=[26~
  set t_F5=[28~
  set t_F6=[29~
  set t_F7=[31~
  set t_F8=[32~
  set t_F9=[33~
endif

let NERDSpaceDelims = 1

nmap gg-G :Neoformat

runtime macros/matchit.vim
autocmd BufReadPost fugitive://* set bufhidden=delete

" Unset 'list' in :Gstatus window (which usually contains tab characters).
autocmd BufReadPost .git/index set nolist
let g:ctrlp_map = '<leader>f'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_working_path_mode = 'rc'

set tags+=gems.tags
set clipboard=unnamed


