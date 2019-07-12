function! fixme#ShowFixmes(findroot)
	if !empty(a:findroot)
		echoerr "Finding the project root is not yet implemented."
		return
	else
		let l:path = '%'
	endif

	let l:search_str = ' /\v<' . join(g:fixme_sigils, '|') . '>/ '
	if g:fixme_debug
		echomsg 'Now searching for: ' . l:search_str
	endif

	execute 'lvimgrep' . l:search_str . l:path
	if g:fixme_openwindow
		lopen  " TODO: comment on this function
	endif

endfunction
