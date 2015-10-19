noremap <script> <buffer> <silent> [MA :<C-U>call MoveToAttributesInMethodClass(1,1,0)<CR>
vnoremap <script> <buffer> <silent> [MA :<C-U>call MoveToAttributesInMethodClass(1,1,1)<CR>
noremap <script> <buffer> <silent> ]MA :<C-U>call MoveToAttributesInMethodClass(1,0,0)<CR>
vnoremap <script> <buffer> <silent> ]MA :<C-U>call MoveToAttributesInMethodClass(1,0,1)<CR>

noremap <script> <buffer> <silent> [CA :<C-U>call MoveToAttributesInMethodClass(0,1,0)<CR>
vnoremap <script> <buffer> <silent> [CA :<C-U>call MoveToAttributesInMethodClass(0,1,1)<CR>
noremap <script> <buffer> <silent> ]CA :<C-U>call MoveToAttributesInMethodClass(0,0,0)<CR>
vnoremap <script> <buffer> <silent> ]CA :<C-U>call MoveToAttributesInMethodClass(0,0,1)<CR>

noremap <script> <buffer> <silent> [MM :<C-U>call MoveToMethodClassName(1,1,0)<CR>
vnoremap <script> <buffer> <silent> [MM :<C-U>call MoveToMethodClassName(1,1,1)<CR>
noremap <script> <buffer> <silent> ]MM :<C-U>call MoveToMethodClassName(1,0,0)<CR>
vnoremap <script> <buffer> <silent> ]MM :<C-U>call MoveToMethodClassName(1,0,1)<CR>

noremap <script> <buffer> <silent> [CC :<C-U>call MoveToMethodClassName(0,1,0)<CR>
vnoremap <script> <buffer> <silent> [CC :<C-U>call MoveToMethodClassName(0,1,1)<CR>
noremap <script> <buffer> <silent> ]CC :<C-U>call MoveToMethodClassName(0,0,0)<CR>
vnoremap <script> <buffer> <silent> ]CC :<C-U>call MoveToMethodClassName(0,0,1)<CR>

function! MoveToAttributesInMethodClass(type, back, visual)
	if a:type
		let typs = 'def'
	else
		let typs = 'class'
	endif
	let pattern = '\(^\s*' . typs . '.\+(\)\zs\([ ]*.*\)\ze):$'
	if a:visual
		normal! gv
	endif
	if a:back
		let dir = '?'
	else
		let dir = '/'
	endif
	execute 'silent normal! ' . dir . pattern . "\r"
endfunction

function! MoveToMethodClassName(type, back, visual)
	if a:type
		let typs = 'def'
	else
		let typs = 'class'
	endif
	let pattern = '\(^\s*' . typs . ' \)\zs.\+\(([ ]*.*):$\)\ze'
	if a:visual
		normal! gv
	endif
	if a:back
		let dir = '?'
	else
		let dir = '/'
	endif
	execute 'silent normal! ' . dir . pattern . "\r"
endfunction
