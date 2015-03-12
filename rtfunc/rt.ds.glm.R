# Real time ds.glm function
rt.ds.glm = function(){
	
	# Execute function
	ex.ds.glm = function(){
		tkdestroy(window.ds.glm)
		x <- toString(tclvalue(xinput_))
		formula <- toString(tclvalue(formulainput_))
		family <- toString(tclvalue(familyrbvalue))
		startCoeff <- toString(tclvalue(startcoeffinput_))
                maxit <- toString(tclvalue(maxitinput_))
		CI <- toString(tclvalue(conflevelinput_))
		viewIter <- toString(tclvalue(viewiterRBvalue))
                ds_command <- parse(text=sprintf("ds.glm(x='%s', formula=%s, family='%s', startCoeff=%s, maxit=%s, CI=%s, viewIter=%s)", x, formula, family, startCoeff, maxit, CI, viewIter))
                print(eval(ds_command))
	}
        # In other functions the construction of the datashield command is
        # done in one step and uses 'paste0' rather than 'sprintf'.
        #
        # Any arguments of the datashield command that are not strings (for
        # example numbers such as 'CI' or booleans such as 'viewIter')
        # must not have single quotes around them. Otherwise they are evaluated
        # incorrectly. Using paste0 makes the difference in quoting hard to read.
        #

	# Cancel function
	cl.ds.glm = function(){
		tkdestroy(window.ds.glm)
	}

	# Draw input window
	window.ds.glm = tktoplevel()
	tkwm.title(window.ds.glm,'ds.glm()')
	inputframe0 = tkframe(window.ds.glm)

	xinput_ = tclVar( 'D' )
	formulainput_ = tclVar( 'FORMULA' )
	familyrbvalue <- tclVar( 'gaussian' )
	startcoeffinput_ = tclVar( 'NULL' )
	maxitinput_ = tclVar( '15' )
	conflevelinput_ = tclVar( '0.95' )
	viewiterRBvalue <- tclVar( 'FALSE' )

        #D
	inputframe1 = tkframe(window.ds.glm)
	tkpack(tklabel(inputframe1,text='Dataframe', width=20),side='left')
	tkpack(tkentry(inputframe1,width=20,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

        #formula
	inputframe2 = tkframe(window.ds.glm)
	tkpack(tklabel(inputframe2,text='Formula', width=20),side='left')
	tkpack(tkentry(inputframe2,width=40,textvariable=formulainput_), side='left', pady=c(2,2), padx=c(2,5))

        #family
	inputframe3 = tkframe(window.ds.glm)
        rbbinomial <- tkradiobutton(inputframe3)
        rbpoisson <- tkradiobutton(inputframe3)
        rbgaussian <- tkradiobutton(inputframe3)
        tkconfigure(rbbinomial, variable=familyrbvalue, value="binomial")
        tkconfigure(rbpoisson, variable=familyrbvalue, value="poisson")
        tkconfigure(rbgaussian, variable=familyrbvalue, value="gaussian")
	tkpack(tklabel(inputframe3,text='Binomial', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbbinomial,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe3,text='Poisson', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbpoisson,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe3,text='Gaussian', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbgaussian,side='left', pady=c(5,5), padx=c(5,10))

        #startcoeff
	inputframe4 = tkframe(window.ds.glm)
	tkpack(tklabel(inputframe4,text='Start Coefficient', width=20),side='left')
	tkpack(tkentry(inputframe4,width=20,textvariable=startcoeffinput_), side='left', pady=c(2,2), padx=c(2,5))

        # maxit
	inputframe5 = tkframe(window.ds.glm)
	tkpack(tklabel(inputframe5,text='Max Iterations', width=20),side='left')
	tkpack(tkentry(inputframe5,width=20,textvariable=maxitinput_), side='left', pady=c(2,2), padx=c(2,5))

        # ci
	inputframe6 = tkframe(window.ds.glm)
	tkpack(tklabel(inputframe6,text='Confidence level', width=20),side='left')
	tkpack(tkentry(inputframe6,width=20,textvariable=conflevelinput_), side='left', pady=c(2,2), padx=c(2,5))

        #viewiter
	inputframe7 = tkframe(window.ds.glm)
        viewiterRBtrue <- tkradiobutton(inputframe7)
        viewiterRBfalse <- tkradiobutton(inputframe7)
        tkconfigure(viewiterRBtrue, variable=viewiterRBvalue, value="TRUE")
        tkconfigure(viewiterRBfalse, variable=viewiterRBvalue, value="FALSE")
	tkpack(tklabel(inputframe7,text='View Iterations: True', width=20), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(viewiterRBtrue,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe7,text='View Iterations: False', width=20), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(viewiterRBfalse,side='left', pady=c(5,5), padx=c(5,10))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.glm),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.glm),side='left', pady=c(10,10) , padx=c(5,10))

        inputframe9 = tkframe(window.ds.glm)
        tkpack(tklabel(inputframe9,text='Advanced', width=10), side='left', pady=c(20,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe9)
	tkpack(inputframe4)
	tkpack(inputframe5)
	tkpack(inputframe6)
	tkpack(inputframe7)
	tkpack(inputframe0)
}

