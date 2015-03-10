# Real time ds.asCharacter function
rt.ds.asCharacter = function(){
	
	# Execute function
	ex.ds.asCharacter = function(){
		tkdestroy(window.ds.asCharacter)
		x <- toString(tclvalue(xinput_))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.asCharacter('", x , "','", newobj ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.asCharacter = function(){
		tkdestroy(window.ds.asCharacter)
	}

	# Draw input window
	window.ds.asCharacter = tktoplevel()
	tkwm.title(window.ds.asCharacter,'ds.asCharacter()')
	inputframe0 = tkframe(window.ds.asCharacter)

	xinput_ = tclVar( 'D$LAB_HDL' )
	newobjinput_ = tclVar( 'new_obj' )

	inputframe1 = tkframe(window.ds.asCharacter)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.asCharacter)
	tkpack(tklabel(inputframe2,text='New Object', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.asCharacter),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.asCharacter),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

