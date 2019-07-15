" fixme.vim - A plugin to show you work that needs to be done
" Maintainer: Cameron Rossington <cameron.rossington@gmail.com>
" Version:    0.1

if exists('g:loaded_fixme') || &compatible
	finish
endif
let g:loaded_fixme = 1


" Section: Settings

let g:fixme_debug = get(g:, 'fixme_debug', 0)
let g:fixme_openwindow = get(g:, 'fixme_openwindow', 1)
let g:fixme_sigils = get(g:, 'fixme_sigils', ['TODO', 'FIXME', 'HACK', 'XXX'])
let g:fixme_vcs = get(g:, 'fixme_vcs', ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/'])

" Section: Commands

command! -bang ShowFixmes :call fixme#ShowFixmes("<bang>")

" Section: Maps

nnoremap <silent> <Plug>FixmeSearch ShowFixmes
if empty(mapcheck('<leader>f', 'n'))
	nmap <leader>f <Plug>FixmeSearch
endif
