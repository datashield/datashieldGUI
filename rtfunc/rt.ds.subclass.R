# Real time ds.subclass function
rt.ds.subclass = function(){

	# Execute function
	ex.ds.subclass = function(){
		tkdestroy(window.ds.subclass)
		x <- toString(tclvalue(xinput_))
                variables <- toString(tclvalue(variablesinput_))
                subsets <- toString(tclvalue(subsetsinput_))
                ds_command <- parse(text=sprintf("ds.subclass(x='%s',variables=%s, subsets='%s')", x, variables, subsets))
                print(eval(ds_command))
	}
        # In other functions the construction of the datashield command is
        # done in one step and uses 'paste0' rather than 'sprintf'.
        #
        # Any arguments of the datashield command that are not strings (for
        # example vectors such as 'variables')
        # must not have single quotes around them. Otherwise they are evaluated
        # incorrectly. Using paste0 makes the difference in quoting hard to read.
        #

	# Cancel function
	cl.ds.subclass = function(){
		tkdestroy(window.ds.subclass)
	}

	# Draw input window
	window.ds.subclass = tktoplevel()
	tkwm.title(window.ds.subclass,'ds.subclass()')
	inputframe0 = tkframe(window.ds.subclass)

	xinput_ = tclVar( 'D' )
	variablesinput_ <- tclVar( 'NULL' )
	subsetsinput_ <- tclVar( 'subClasses' )

	inputframe1 = tkframe(window.ds.subclass)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

        inputframe2=tkframe(window.ds.subclass)
	tkpack(tklabel(inputframe2,text='Variables', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=variablesinput_), side='left', pady=c(2,2), padx=c(2,5))

        inputframe3=tkframe(window.ds.subclass)
	tkpack(tklabel(inputframe3,text='Subsets', width=20),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=subsetsinput_), side='left', pady=c(2,2), padx=c(2,5))


	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.subclass),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.subclass),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe0)
}

