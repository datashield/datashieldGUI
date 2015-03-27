# Real time ds.cor function
rt.ds.cor = function(){
	
	# Execute function
	ex.ds.cor = function(){
		tkdestroy(window.ds.cor)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		print(eval(parse(text=   paste0("ds.cor('", x , "','" , y , "')" , sep="")   )))
	}

	# Cancel function
	cl.ds.cor = function(){
		tkdestroy(window.ds.cor)
	}

	# Draw input window
	window.ds.cor = tktoplevel()
	tkwm.title(window.ds.cor,'ds.cor()')
	inputframe0 = tkframe(window.ds.cor)

	xinput_ = tclVar( 'variable_name' )
	yinput_ = tclVar( 'variable_name' )

	inputframe1 = tkframe(window.ds.cor)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.cor)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.cor),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.cor),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

