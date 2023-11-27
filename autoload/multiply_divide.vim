function! multiply_divide#Multiply()
    function! s:inner(...) closure abort
        let count = v:count1
        if count == 1 && exists("g:multiply_last_count")
            let count = g:multiply_last_count
        else
            let g:multiply_last_count = count
        endif
        let save_z = getreg("z")
        let save_z_type = getregtype("z")
        " in the current line, go to the next digit that is not followed by another digit or decimal point
        if search('\v\d([^0-9\.]|$)', 'cW', line('.')) == 0
            return
        end
        normal! v
        " then, in visual mode, search backward for the next digit which is not preceded by another digit or decimal point
        call search('\v(^|[^0-9\.]\d)', 'bceW')
        normal! "zygv
        let number = (match(@z, '\V.') != -1) ? str2float(@z) : str2nr(@z)
        execute 'normal! "_c' . string(number * count)
        call setreg("z", save_z, save_z_type)
    endfunction
    let &opfunc=get(funcref('s:inner'), 'name')
    return 'g@l'
endfunction

function! multiply_divide#Divide()
    function! s:inner(...) closure abort
        let count = v:count1
        if count == 1 && exists("g:divide_last_count")
            let count = g:divide_last_count
        else
            let g:divide_last_count = count
        endif
        let save_z = getreg("z")
        let save_z_type = getregtype("z")
        " in the current line, go to the next digit that is not followed by another digit or decimal point
        if search('\v\d([^0-9\.]|$)', 'cW', line('.')) == 0
            return
        end
        normal! v
        " then, in visual mode, search backward for the next digit which is not preceded by another digit or decimal point
        call search('\v(^|[^0-9\.]\d)', 'bceW')
        normal! "zygv
        let old_number = (match(@z, '\V.') != -1) ? str2float(@z) : str2nr(@z)
        let new_number = type(old_number) == v:t_number && old_number % count != 0 ?
                    \ str2float(old_number) / count :
                    \ old_number / count
        execute 'normal! "_c' . string(new_number)
        call setreg("z", save_z, save_z_type)
    endfunction
    let &opfunc=get(funcref('s:inner'), 'name')
    return 'g@l'
endfunction
