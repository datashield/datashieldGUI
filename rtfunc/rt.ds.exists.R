# Real time ds.exists function
rt.ds.exists = function(){

	# Execute function
	ex.ds.exists = function(){
		tkdestroy(window.ds.exists)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.exists('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.exists = function(){
		tkdestroy(window.ds.exists)
	}

	# Draw input window
	window.ds.exists = tktoplevel()
	tkwm.title(window.ds.exists,'ds.exists()')
	inputframe0 = tkframe(window.ds.exists)

	xinput_ = tclVar( 'D$LAB_HDL' )

	inputframe1 = tkframe(window.ds.exists)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.exists),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.exists),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

