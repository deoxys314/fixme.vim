" fixme.vim - A plugin to show you work that needs to be done
" Maintainer: Cameron Rossington <cameron.rossington@gmail.com>
" Version:    0.1

if exists('g:loaded_fixme') || &cp
	finish
endif
let g:loaded_fixme = 1


" Section: Settings

if !exists('g:fixme_sigils')
	let g:fixme_sigils = ['TODO', 'FIXME', 'HACK', 'XXX']
endif

if !exists('g:fixme_openwindow')
	let g:fixme_openwindow = 1
endif

if !exists('g:fixme_debug')
	let g:fixme_debug = 0
endif

" Section: Commands

command! -bang ShowFixmes :call fixme#ShowFixmes("<bang>")

" Section: Maps

nnoremap <silent> <Plug>FixmeSearch ShowFixmes
if empty(mapcheck('<leader>f', 'n'))
	nmap <leader>f <Plug>FixmeSearch
endif
