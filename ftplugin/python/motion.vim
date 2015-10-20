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

"Create Method for inner word
nnoremap <Leader>f :call CreateMethodForInnerWord()<cr>

function! CreateMethodForInnerWord()
	normal! ma<cr>
	execute 'normal! "pyiwo' . "\<BS>\<Del>\rdef" ."\<esc>i\<right>\<c-r>=TriggerSnippet()" . "\r"
	execute 'normal! ' ."\<Del>" . 'h"pp' . "\r"
	normal! `a<cr>
endfunction
