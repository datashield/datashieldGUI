# Real time ds.subset function
rt.ds.subset = function(){

	# Execute function
	ex.ds.subset = function(){
		tkdestroy(window.ds.subset)
		x <- toString(tclvalue(xinput_))
                subset <- toString(tclvalue(subsetinput_))
                completeCases <- toString(tclvalue(rbvalue))
                rows <- toString(tclvalue(rowsinput_))
                cols <- toString(tclvalue(colsinput_))
                logicalOperator <- toString(tclvalue(logopinput_))
                threshold <- toString(tclvalue(thresinput_))
                ds_command <- parse(text=sprintf("ds.subset(x='%s',subset='%s', completeCases=%s, rows=%s, cols=%s, logicalOperator='%s', threshold=%s)", x, subset, completeCases, rows, cols, logicalOperator, threshold))
                print(eval(ds_command))
	}
        # In other functions the construction of the datashield command is
        # done in one step and uses 'paste0' rather than 'sprintf'.
        #
        # Any arguments of the datashield command that are not strings (for
        # example numbers such as 'threshold' or vectors such as 'rows')
        # must not have single quotes around them. Otherwise they are evaluated
        # incorrectly. Using paste0 makes the difference in quoting hard to read.
        #

	# Cancel function
	cl.ds.subset = function(){
		tkdestroy(window.ds.subset)
	}

	# Draw input window
	window.ds.subset = tktoplevel()
	tkwm.title(window.ds.subset,'ds.subset()')
	inputframe0 = tkframe(window.ds.subset)

	xinput_ = tclVar( 'D' )
	subsetinput_ <- tclVar( 'subsetObject' )
	rbvalue <- tclVar( 'FALSE' )
	rowsinput_ <- tclVar( 'NULL' )
	colsinput_ <- tclVar( 'NULL' )
	logopinput_ <- tclVar( 'NULL' )
	thresinput_ <- tclVar( 'NULL' )

	inputframe1 = tkframe(window.ds.subset)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

        inputframe2=tkframe(window.ds.subset)
	tkpack(tklabel(inputframe2,text='Subset name', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=subsetinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.subset)
        rbtrue<- tkradiobutton(inputframe3)
        rbfalse <- tkradiobutton(inputframe3)
        tkconfigure(rbtrue, variable=rbvalue, value="TRUE")
        tkconfigure(rbfalse, variable=rbvalue, value="FALSE")
	tkpack(tklabel(inputframe3,text='Complete cases: True', width=20), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbtrue,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe3,text='Complete cases: False', width=20), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbfalse,side='left', pady=c(5,5), padx=c(5,10))

	inputframe4 = tkframe(window.ds.subset)
	tkpack(tklabel(inputframe4,text='Advanced', width=20),side='left', pady=c(20,10))

        inputframe5=tkframe(window.ds.subset)
	tkpack(tklabel(inputframe5,text='Rows', width=20),side='left')
	tkpack(tkentry(inputframe5,width=30,textvariable=rowsinput_), side='left', pady=c(2,2), padx=c(2,5))

        inputframe6=tkframe(window.ds.subset)
	tkpack(tklabel(inputframe6,text='Columns', width=20),side='left')
	tkpack(tkentry(inputframe6,width=30,textvariable=colsinput_), side='left', pady=c(2,2), padx=c(2,5))

        inputframe7=tkframe(window.ds.subset)
	tkpack(tklabel(inputframe7,text='Logical Operator', width=20),side='left')
	tkpack(tkentry(inputframe7,width=30,textvariable=logopinput_), side='left', pady=c(2,2), padx=c(2,5))

        inputframe8=tkframe(window.ds.subset)
	tkpack(tklabel(inputframe8,text='Threshold', width=20),side='left')
	tkpack(tkentry(inputframe8,width=30,textvariable=thresinput_), side='left', pady=c(2,2), padx=c(2,5))


	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.subset),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.subset),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe4)
	tkpack(inputframe5)
	tkpack(inputframe6)
	tkpack(inputframe7)
	tkpack(inputframe8)
	tkpack(inputframe0)
}

