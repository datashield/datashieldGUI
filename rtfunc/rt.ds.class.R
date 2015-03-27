# Real time ds.class function
rt.ds.class = function(){

	# Execute function
	ex.ds.class = function(){
		tkdestroy(window.ds.class)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.class('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.class = function(){
		tkdestroy(window.ds.class)
	}

	# Draw input window
	window.ds.class = tktoplevel()
	tkwm.title(window.ds.class,'ds.class()')
	inputframe0 = tkframe(window.ds.class)

	xinput_ = tclVar( 'variable_name' )

	inputframe1 = tkframe(window.ds.class)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.class),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.class),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

