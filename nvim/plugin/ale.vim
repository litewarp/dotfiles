let g:ale_linter_aliases = { 'jsx': ['css', 'javascript'] }

let g:ale_linters = {
\ 'javascript': ['eslint', 'flow', 'stylelint', 'prettier'],
\ 'jsx': ['stylelint'],
\ 'ruby' : ['prettier']
\ }

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'jsx': ['prettier'],
\   'ruby': ['prettier'],
\   }

let g:ale_linters_ignore = ['tsserver']

nmap <leader>d <Plug>(ale_fix)

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

" Use ALT-k and ALT-j to navigate errors
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--no-semi --trailing-comma all --insert-pragma'
