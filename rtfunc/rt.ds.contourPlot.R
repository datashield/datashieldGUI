# Real time ds.contourPlot function
rt.ds.contourPlot = function(){
	
	# Execute function
	ex.ds.contourPlot = function(){
		tkdestroy(window.ds.contourPlot)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		type <- toString(tclvalue(rbvalue))
		print(eval(parse(text=   paste0("ds.contourPlot('", x , "','" , y , "','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.contourPlot = function(){
		tkdestroy(window.ds.contourPlot)
	}

	# Draw input window
	window.ds.contourPlot = tktoplevel()
	tkwm.title(window.ds.contourPlot,'ds.contourPlot()')
	inputframe0 = tkframe(window.ds.contourPlot)

	xinput_ = tclVar( 'D$LAB_HDL' )
	yinput_ = tclVar( 'D$LAB_TSC' )
	rbvalue <- tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.contourPlot)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.contourPlot)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.contourPlot)
        rbsplt <- tkradiobutton(inputframe3)
        rbcomb <- tkradiobutton(inputframe3)
        tkconfigure(rbsplt, variable=rbvalue, value="split")
        tkconfigure(rbcomb, variable=rbvalue, value="combine")
	tkpack(tklabel(inputframe3,text='Split', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbsplt,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe3,text='Combine', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbcomb,side='left', pady=c(5,5), padx=c(5,10))


	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.contourPlot),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.contourPlot),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe0)
}

