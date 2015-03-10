# Real time ds.meanByClass function
rt.ds.meanByClass = function(){
	
	# Execute function
	ex.ds.meanByClass = function(){
		tkdestroy(window.ds.meanByClass)
		x <- toString(tclvalue(xinput_))
		outvar <- toString(tclvalue(outvarinput_))
		covar <- toString(tclvalue(covarinput_))
		type <- toString(tclvalue(rbvalue))
		print(eval(parse(text=   paste0("ds.meanByClass('", x ,"','", outvar ,"','", covar ,"','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.meanByClass = function(){
		tkdestroy(window.ds.meanByClass)
	}

	# Draw input window
	window.ds.meanByClass = tktoplevel()
	tkwm.title(window.ds.meanByClass,'ds.meanByClass()')
	inputframe0 = tkframe(window.ds.meanByClass)

	xinput_ = tclVar( 'D' )
	outvarinput_ = tclVar( 'LAB_HDL' )
	covarinput_ = tclVar( 'GENDER' )
	rbvalue <- tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.meanByClass)
	tkpack(tklabel(inputframe1,text='dataframe', width=30),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.meanByClass)
	tkpack(tklabel(inputframe2,text='Outvar: continuous variables', width=30),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=outvarinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.meanByClass)
	tkpack(tklabel(inputframe3,text='Covar: categorical variables', width=30),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=covarinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe4 = tkframe(window.ds.meanByClass)
        rbsplt <- tkradiobutton(inputframe4)
        rbcomb <- tkradiobutton(inputframe4)
        tkconfigure(rbsplt, variable=rbvalue, value="split")
        tkconfigure(rbcomb, variable=rbvalue, value="combine")
	tkpack(tklabel(inputframe4,text='Split', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbsplt,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe4,text='Combine', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbcomb,side='left', pady=c(5,5), padx=c(5,10))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.meanByClass),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.meanByClass),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe4)
	tkpack(inputframe0)
}

