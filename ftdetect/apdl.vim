" Automatic detection of file-type by inspecting the file's extension
augroup apdlDetect
    autocmd!
    autocmd BufRead,BufNewFile *.inp set filetype=apdl
augroup END
