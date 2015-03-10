# Real time ds.isValid function
rt.ds.isValid = function(){

	# Execute function
	ex.ds.isValid = function(){
		tkdestroy(window.ds.isValid)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.isValid('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.isValid = function(){
		tkdestroy(window.ds.isValid)
	}

	# Draw input window
	window.ds.isValid = tktoplevel()
	tkwm.title(window.ds.isValid,'ds.isValid()')
	inputframe0 = tkframe(window.ds.isValid)

	xinput_ = tclVar( 'D$LAB_HDL' )

	inputframe1 = tkframe(window.ds.isValid)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.isValid),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.isValid),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

