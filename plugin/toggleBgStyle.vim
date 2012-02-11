" Create a function and corresponding
" key mapping for toggle between
" light and dark background style

function! YI_ToggleBackground()
	if &bg=='light'
		se bg=dark
		" potential hook place for changing color theme
		" no need for solarized
	else
		se bg=light
		" potential hook place for changing color theme
		" no need for solarized
	endif
endfunction

noremap <F11> :call YI_ToggleBackground()<CR>
