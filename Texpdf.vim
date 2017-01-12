function s:myplatexpdf( ... ) abort
	if len( a:000 ) == 0
		call s:autotexpdf()
	    call system("evince ".expand("%:r").".pdf &")
		redraw!
	else
		if a:1 == "on"
			autocmd InsertLeave *.tex call s:autotexpdf()
		elseif a:1 == "off"
			autocmd! InsertLeave *.tex
		endif
	endif
endfunction

function s:autotexpdf() abort
	let x = expand("%:r")
	execute ":write! "
	call system( "platex ".x.".tex" )
	call system( "dvipdfmx ".x.".dvi" )
	call system( "rm ".x.".log ".x.".dvi "."texput.log " )
	redraw!
endfunction

command -nargs=* Texpdf call s:myplatexpdf(<f-args>)

