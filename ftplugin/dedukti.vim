" Vim ftplugin file
" Language: Dedukti
" Maintainer: Antoine Defourné
" Last Revision: 08/03/2017

if !exists('g:dkcheck_command')
	let g:dkcheck_command = 'dkcheck'
endif

let g:dkcheck_command = 'dkcheck'
let g:dkchecl_nl = 0

nnoremap <buffer> <F5> :write<CR>:call dedukti#DkCompile()<CR>

nnoremap <buffer> <localleader>t :set operatorfunc=dedukti#DkCommentRegion<CR>g@
vnoremap <buffer> <localleader>t :<C-U>call dedukti#DkCommentRegion(visualmode())<CR>

nnoremap <buffer> <localleader>u :call dedukti#DkUncommentRegion()<CR>
