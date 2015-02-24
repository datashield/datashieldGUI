# Real time ds.dim function
rt.ds.dim = function(){
	
	# Execute function
	ex.ds.dim = function(){
		tkdestroy(window.ds.dim)
		x <- toString(tclvalue(xinput_))
		type <- toString(tclvalue(typeinput_))
		print(eval(parse(text=   paste0("ds.dim('", x ,"','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.dim = function(){
		tkdestroy(window.ds.dim)
	}

	# Draw input window
	window.ds.dim = tktoplevel()
	tkwm.title(window.ds.dim,'ds.dim()')
	inputframe0 = tkframe(window.ds.dim)

	xinput_ = tclVar( 'D' )
	typeinput_ = tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.dim)
	tkpack(tklabel(inputframe1,text='Dataframe', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.dim)
	tkpack(tklabel(inputframe2,text='Type', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=typeinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.dim),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.dim),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

