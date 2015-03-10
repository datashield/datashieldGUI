# Real time ds.rowColCalc function
rt.ds.rowColCalc = function(){
	
	# Execute function
	ex.ds.rowColCalc = function(){
		tkdestroy(window.ds.rowColCalc)
		x <- toString(tclvalue(xinput_))
		operation <- toString(tclvalue(operationvalue))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.rowColCalc('", x ,"','", operation ,"','", newobj ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.rowColCalc = function(){
		tkdestroy(window.ds.rowColCalc)
	}

	# Draw input window
	window.ds.rowColCalc = tktoplevel()
	tkwm.title(window.ds.rowColCalc,'ds.rowColCalc()')
	inputframe0 = tkframe(window.ds.rowColCalc)

	xinput_ = tclVar( 'D' )
	operationvalue = tclVar( 'rowSums' )
	newobjinput_ = tclVar( 'rsum_D' )

	inputframe1 = tkframe(window.ds.rowColCalc)
	tkpack(tklabel(inputframe1,text='Dataframe', width=30),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.rowColCalc)
        rbrowsums <- tkradiobutton(inputframe2)
        rbcolsums <- tkradiobutton(inputframe2)
        rbrowmeans <- tkradiobutton(inputframe2)
        rbcolmeans <- tkradiobutton(inputframe2)
        tkconfigure(rbrowsums, variable=operationvalue, value="rowSums")
        tkconfigure(rbcolsums, variable=operationvalue, value="colSums")
        tkconfigure(rbrowmeans, variable=operationvalue, value="rowMeans")
        tkconfigure(rbcolmeans, variable=operationvalue, value="colMeans")
	tkpack(tklabel(inputframe2,text='rowSums', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbrowsums,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe2,text='colSums', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbcolsums,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe2,text='rowMeans', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbrowmeans ,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe2,text='colMeans', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbcolmeans,side='left', pady=c(5,5), padx=c(5,5))

	inputframe3 = tkframe(window.ds.rowColCalc)
	tkpack(tklabel(inputframe3,text='New object', width=30),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.rowColCalc),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.rowColCalc),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe3)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

