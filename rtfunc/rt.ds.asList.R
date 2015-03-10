# Real time ds.asList function
rt.ds.asList = function(){
	
	# Execute function
	ex.ds.asList = function(){
		tkdestroy(window.ds.asList)
		x <- toString(tclvalue(xinput_))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.asList('", x , "','", newobj ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.asList = function(){
		tkdestroy(window.ds.asList)
	}

	# Draw input window
	window.ds.asList = tktoplevel()
	tkwm.title(window.ds.asList,'ds.asList()')
	inputframe0 = tkframe(window.ds.asList)

	xinput_ = tclVar( 'D' )
	newobjinput_ = tclVar( 'new_obj' )

	inputframe1 = tkframe(window.ds.asList)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.asList)
	tkpack(tklabel(inputframe2,text='New Object', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.asList),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.asList),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

