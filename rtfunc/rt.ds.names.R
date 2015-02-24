# Real time ds.names function
rt.ds.names = function(){

	# Execute function
	ex.ds.names = function(){
		tkdestroy(window.ds.names)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.names('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.names = function(){
		tkdestroy(window.ds.names)
	}

	# Draw input window
	window.ds.names = tktoplevel()
	tkwm.title(window.ds.names,'ds.names()')
	inputframe0 = tkframe(window.ds.names)

	xinput_ = tclVar( 'subclasses' )

	inputframe1 = tkframe(window.ds.names)
	tkpack(tklabel(inputframe1,text='List object', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.names),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.names),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

