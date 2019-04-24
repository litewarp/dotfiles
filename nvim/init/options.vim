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


let g:yankring_replace_n_pkey = '<C-Tab>'
let g:yankring_replace_n_nkey = '<C-S-Tab>'
let g:yankring_history_file = '.vim_yankring_history'

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

" surround.vim: Add $ as a jQuery surround, _ for Underscore.js
autocmd FileType javascript let b:surround_36 = "$(\r)"
                        \ | let b:surround_95 = "_(\r)"


" Pad comment delimeters with spaces
let NERDSpaceDelims = 1

nmap gg-G :Neoformat


runtime macros/matchit.vim
" Change background color when inserting.
" (Broken in terminal Vim: Solarized has a bug which makes it reload poorly.)
" http://www.reddit.com/r/vim/comments/ggbcp/solarized_color_scheme/
if has("gui_running")
  " Commented out to support vim-powerline
  " let g:insert_mode_background_color = "#18434E"
end
" Automatically delete Fugitive buffers that are no longer being used.
" Otherwise, they tend to fill up the buffer list.
"
" Credit to Drew Neil of Vimcasts:
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/

autocmd BufReadPost fugitive://* set bufhidden=delete

" Unset 'list' in :Gstatus window (which usually contains tab characters).
autocmd BufReadPost .git/index set nolist
let g:ctrlp_map = '<leader>f'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_working_path_mode = 'rc'

set tags+=gems.tags
set clipboard=unnamed


" Find unused Cucumber steps
command! CucumberFindUnusedSteps :call CucumberFindUnusedSteps()
function! CucumberFindUnusedSteps()
  let olderrorformat = &l:errorformat
  try
    set errorformat=%m#\ %f:%l
    cexpr system('bundle exec cucumber --no-profile --no-color --format usage --dry-run features \| grep "NOT MATCHED BY ANY STEPS" -B1 \| egrep -v "(--\|NOT MATCHED BY ANY STEPS)"')
    cwindow
  finally
    let &l:errorformat = olderrorformat
  endtry
endfunction
