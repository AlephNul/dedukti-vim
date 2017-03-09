" Vim autoload file
" Language: Dedukti
" Maintainer: Antoine Defourné
" Last Revision: 08/03/2017

function! dedukti#DkCompile()
	let dkcheck_args = ''

	if g:dkcheck_nl
		let dkcheck_args .= ' -nl'
	endif

	execute '!' g:dkcheck_command. dkcheck_args bufname('%')
endfunction

function! dedukti#DkCommentRegion(type)
	if a:type ==# 'char'
		execute "normal! `[i(;\<SPACE>\<ESC>`]3la;)\<SPACE>\<ESC>"
	elseif a:type ==# 'v'
		execute "normal! `<i(;\<SPACE>\<ESC>`>3la\<SPACE>;)\<ESC>"
	elseif a:type ==# 'V'
		execute "normal! `<I(;\<SPACE>\<ESC>`>A\<SPACE>;)\<ESC>"
	endif
endfunction

function! dedukti#DkUncommentRegion()
	let b:old_register = @/

	execute "normal! ?\\v\\(;\<CR>vawd/\\v;\\)\<CR>vawd"

	let @/ = b:old_register
endfunction
