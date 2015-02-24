# Real time ds.tTest function
rt.ds.tTest = function(){
	
	# Execute function
	ex.ds.tTest = function(){
		tkdestroy(window.ds.tTest)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		type <- toString(tclvalue(typeinput_))
		print(eval(parse(text=   paste0("ds.tTest('", x , "','" , y , "','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.tTest = function(){
		tkdestroy(window.ds.tTest)
	}

	# Draw input window
	window.ds.tTest = tktoplevel()
	tkwm.title(window.ds.tTest,'ds.tTest()')
	inputframe0 = tkframe(window.ds.tTest)

	xinput_ = tclVar( 'D$LAB_HDL' )
	yinput_ = tclVar( 'D$LAB_TSC' )
	typeinput_ = tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.tTest)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.tTest)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.tTest)
	tkpack(tklabel(inputframe3,text='Type', width=20),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=typeinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.tTest),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.tTest),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe0)
}

