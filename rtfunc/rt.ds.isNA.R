# Real time ds.isNA function
rt.ds.isNA = function(){

	# Execute function
	ex.ds.isNA = function(){
		tkdestroy(window.ds.isNA)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.isNA('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.isNA = function(){
		tkdestroy(window.ds.isNA)
	}

	# Draw input window
	window.ds.isNA = tktoplevel()
	tkwm.title(window.ds.isNA,'ds.isNA()')
	inputframe0 = tkframe(window.ds.isNA)

	xinput_ = tclVar( 'variable_name' )

	inputframe1 = tkframe(window.ds.isNA)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.isNA),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.isNA),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

