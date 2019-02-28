" TEST Functions (for example APDL mappings)-------------------------{{{
function! PrependRegWithDirPath()
	:execute "let @\"='" . expand("%:p:h") . "/" . getreg('"') . "'"
endfunction 

function! MoveToLowestWindow()
	let c = 1
	while c<=winnr()
		wincmd j
		let c +=1
	endwhile
endfunction
" }}}
" apdl file settings ---------- {{{
augroup filetype_apdl
  autocmd!
  autocmd FileType apdl nnoremap <buffer> <localleader>vsp 0f,l"ayt,:execute "vsp " . expand("%:p:h") . "/" . getreg('a') . ".inp"<CR><C-W><C-L>j
  autocmd FileType apdl nnoremap <buffer> <localleader>sp 0f,l"ayt,:call PrependRegWithDirPath()<CR><C-W><C-H>:call MoveToLowestWindow()<CR>:sp<CR><C-W><C-J>:execute "e " . getreg('a') . ".inp\""<CR><C-W><C-L>j
  autocmd FileType apdl nnoremap <buffer> <localleader>c I!<esc>j
augroup END
" }}}
