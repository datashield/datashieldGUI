# Real time ds.corTest function
rt.ds.corTest = function(){
	
	# Execute function
	ex.ds.corTest = function(){
		tkdestroy(window.ds.corTest)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		print(eval(parse(text=   paste0("ds.corTest('", x , "','" , y , "')" , sep="")   )))
	}

	# Cancel function
	cl.ds.corTest = function(){
		tkdestroy(window.ds.corTest)
	}

	# Draw input window
	window.ds.corTest = tktoplevel()
	tkwm.title(window.ds.corTest,'ds.corTest()')
	inputframe0 = tkframe(window.ds.corTest)

	xinput_ = tclVar( 'variable_name' )
	yinput_ = tclVar( 'variable_name' )

	inputframe1 = tkframe(window.ds.corTest)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.corTest)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.corTest),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.corTest),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

