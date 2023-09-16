" Reload guard {{{
if &compatible || exists("g:loaded_multiply_divide")
    finish
endif
let g:loaded_multiply_divide = 1
" }}}

" force reload autoloading hack {{{
" call multiply_divide#Baaad()
" }}}

" Plug mappings {{{
nnoremap <silent><expr> <Plug>(multiply) multiply_divide#Multiply()
nnoremap <silent><expr> <Plug>(divide) multiply_divide#Divide()
" }}}

" suggested mappings {{{
" nmap <Leader><C-a> <Plug>(multiply)
" nmap <Leader><C-x> <Plug>(divide)
" }}}
