# Real time ds.histogram function
rt.ds.histogram = function(){
	
	# Execute function
	ex.ds.histogram = function(){
		tkdestroy(window.ds.histogram)
		x <- toString(tclvalue(xinput_))
		type <- toString(tclvalue(rbvalue))
		print(eval(parse(text=   paste0("ds.histogram('", x ,"','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.histogram = function(){
		tkdestroy(window.ds.histogram)
	}

	# Draw input window
	window.ds.histogram = tktoplevel()
	tkwm.title(window.ds.histogram,'ds.histogram()')
	inputframe0 = tkframe(window.ds.histogram)

	xinput_ = tclVar( 'variable_name' )
	rbvalue <- tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.histogram)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.histogram)
        rbsplt <- tkradiobutton(inputframe2)
        rbcomb <- tkradiobutton(inputframe2)
        tkconfigure(rbsplt, variable=rbvalue, value="split")
        tkconfigure(rbcomb, variable=rbvalue, value="combine")
	tkpack(tklabel(inputframe2,text='Split', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbsplt,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe2,text='Combine', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbcomb,side='left', pady=c(5,5), padx=c(5,10))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.histogram),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.histogram),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

