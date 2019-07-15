function! fixme#FindFixmes(findroot) abort

	if !empty(a:findroot)
		echoerr 'Finding the project root is not yet implemented.'
		return
	else
		let l:path = '%'
	endif

	let l:search_str = ' /\v\C<' . join(g:fixme_sigils, '|') . '>/ '
	if g:fixme_debug
		echomsg 'Now searching for: ' . l:search_str
	endif

	execute 'vimgrep' . l:search_str . l:path
	if g:fixme_openwindow
		copen
	endif

endfunction
