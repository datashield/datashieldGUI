# Real time ds.summary function
rt.ds.summary = function(){
	
	# Execute function
	ex.ds.summary = function(){
		tkdestroy(window.ds.summary)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.summary('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.summary = function(){
		tkdestroy(window.ds.summary)
	}

	# Draw input window
	window.ds.summary = tktoplevel()
	tkwm.title(window.ds.summary,'ds.summary()')
	inputframe0 = tkframe(window.ds.summary)

	xinput_ = tclVar( 'variable_name' )

	inputframe1 = tkframe(window.ds.summary)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.summary),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.summary),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

