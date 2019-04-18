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
