# Real time ds.levels function
rt.ds.levels = function(){

	# Execute function
	ex.ds.levels = function(){
		tkdestroy(window.ds.levels)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.levels('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.levels = function(){
		tkdestroy(window.ds.levels)
	}

	# Draw input window
	window.ds.levels = tktoplevel()
	tkwm.title(window.ds.levels,'ds.levels()')
	inputframe0 = tkframe(window.ds.levels)

	xinput_ = tclVar( 'variable_name' )

	inputframe1 = tkframe(window.ds.levels)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.levels),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.levels),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

