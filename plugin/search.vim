if exists('g:loaded_search_plugin') && g:loaded_search_plugin
  finish
endif
let g:loaded_search_plugin = 1

" This is my more comfortable search with rg, fzf, and friends...
" one for selecting a word...
" nmap <silent> <Leader>s :execute 'FindUnderCursor'<CR>
" ...and one for selecting the highlighted text
" vmap <silent> <Leader>s :call FindText()<CR>

command! -bang -nargs=* Search
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \    fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

command! -bang -nargs=* FindUnderCursor
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1,
      \    fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0)

function! FindText() range
    " see: https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript/6271254#6271254
    " Get the line and column of the visual selection marks
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]

    " Get all the lines represented by this range
    let lines = getline(line_start, line_end)

    " The last line might need to be cut if the visual selection didn't end on the last column
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    " The first line might need to be trimmed if the visual selection didn't start on the first column
    let lines[0] = lines[0][column_start - 1:]

    " Get the desired text
    let selectedText = join(lines, "\n")

    execute 'Search '.selectedText
endfunction
