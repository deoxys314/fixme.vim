function! fixme#FindFixmes(findroot) abort

	if !empty(a:findroot)
		let l:path = s:FixmeFindPath() . '/**'
	else
		let l:path = '%'
	endif

	let l:search_str = ' /\v\C<' . join(g:fixme_sigils, '|') . '>/ '
	call s:FixmeDebugEcho('Now searching for: ' . join(g:fixme_sigils, ', '))

	execute 'silent! vimgrep' . l:search_str . l:path
	if len(getqflist()) == 0
		echomsg 'No fixme results found.'
		return
	endif

	if g:fixme_openwindow
		copen
	endif

endfunction


function! s:FixmeDebugEcho(string) abort
	if g:fixme_debug
		echomsg a:string
	endif
endfunction


function! s:FixmeFindPath() abort

	for l:pattern in g:fixme_vcs
		" for each pattern in the vcs list, we walk up the directories to see
		" if we can find it. If we do, return early (Do no more work than
		" necessary.) Otherwise, we fall back to the directory the file is in.

		let l:dir = expand('%:p')

		while l:dir !=# fnamemodify(l:dir, ':h')
			let l:dir = fnamemodify(l:dir, ':h')
			" if 1 " if the path + pattern exists
			call s:FixmeDebugEcho('Looking for: ' . l:dir . '/' . l:pattern)
			if !empty(glob(l:dir . '/' .  l:pattern))
				call s:FixmeDebugEcho('Found it!')
				return l:dir
			endif
		endwhile

	endfor

	return expand('%:p:h')

endfunction
