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
let g:airline#extensions#ale#enabled = 1

"line guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"ale_settings
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 1

let g:neosnippet#enable_completed_snippet = 1

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

let g:yankring_clipboard_monitor=0
let g:yankring_replace_n_pkey = '<C-Tab>'
let g:yankring_replace_n_nkey = '<C-S-Tab>'
let g:yankring_history_file = '.vim_yankring_history'

let g:blockle_mapping = '<leader>B'

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

