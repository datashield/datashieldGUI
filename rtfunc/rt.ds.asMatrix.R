# Real time ds.asMatrix function
rt.ds.asMatrix = function(){
	
	# Execute function
	ex.ds.asMatrix = function(){
		tkdestroy(window.ds.asMatrix)
		x <- toString(tclvalue(xinput_))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.asMatrix('", x , "','", newobj ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.asMatrix = function(){
		tkdestroy(window.ds.asMatrix)
	}

	# Draw input window
	window.ds.asMatrix = tktoplevel()
	tkwm.title(window.ds.asMatrix,'ds.asMatrix()')
	inputframe0 = tkframe(window.ds.asMatrix)

	xinput_ = tclVar( 'D' )
	newobjinput_ = tclVar( 'new_obj' )

	inputframe1 = tkframe(window.ds.asMatrix)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.asMatrix)
	tkpack(tklabel(inputframe2,text='New Object', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.asMatrix),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.asMatrix),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

