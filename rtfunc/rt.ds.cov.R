# Real time ds.cov function
rt.ds.cov = function(){
	
	# Execute function
	ex.ds.cov = function(){
		tkdestroy(window.ds.cov)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		print(eval(parse(text=   paste0("ds.cov('", x , "','" , y , "')" , sep="")   )))
	}

	# Cancel function
	cl.ds.cov = function(){
		tkdestroy(window.ds.cov)
	}

	# Draw input window
	window.ds.cov = tktoplevel()
	tkwm.title(window.ds.cov,'ds.cov()')
	inputframe0 = tkframe(window.ds.cov)

	xinput_ = tclVar( 'D$LAB_HDL' )
	yinput_ = tclVar( 'D$LAB_TSC' )

	inputframe1 = tkframe(window.ds.cov)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.cov)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.cov),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.cov),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

