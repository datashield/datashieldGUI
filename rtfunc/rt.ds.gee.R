# Real time ds.gee function
rt.ds.gee = function(){
	
	# Execute function
	ex.ds.gee = function(){
		tkdestroy(window.ds.gee)
		x <- toString(tclvalue(xinput_))
		formula <- toString(tclvalue(formulainput_))
		family <- toString(tclvalue(familyrbvalue))
		corStructure <- toString(tclvalue(corstructurerbvalue))
                clusterID <- toString(tclvalue(clusteridinput_))
		startCoeff <- toString(tclvalue(startcoeffinput_))
		userMatrix <- toString(tclvalue(usermatrixinput_))
                maxit <- toString(tclvalue(maxitinput_))
		display <- toString(tclvalue(displayRBvalue))
                ds_command <- parse(text=sprintf("ds.gee(x='%s', formula=%s, family='%s', corStructure='%s', clusterID='%s', startCoeff=%s, userMatrix=%s, maxit=%s, display=%s)", x, formula, family, corStructure, clusterID, startCoeff, userMatrix, maxit, display))
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
	cl.ds.gee = function(){
		tkdestroy(window.ds.gee)
	}

	# Draw input window
	window.ds.gee = tktoplevel()
	tkwm.title(window.ds.gee,'ds.gee()')
	inputframe0 = tkframe(window.ds.gee)

	xinput_ = tclVar( 'D' )
	formulainput_ = tclVar( 'FORMULA' )
	familyrbvalue <- tclVar( 'gaussian' )
	corstructurerbvalue <- tclVar( 'ar1' )
	clusteridinput_ = tclVar( 'NULL' )
	startcoeffinput_ = tclVar( 'NULL' )
	usermatrixinput_ = tclVar( 'NULL' )
	maxitinput_= tclVar( '20' )
	displayRBvalue <- tclVar( 'FALSE' )

        # D
	inputframe1 = tkframe(window.ds.gee)
	tkpack(tklabel(inputframe1,text='Dataframe', width=30),side='left')
	tkpack(tkentry(inputframe1,width=20,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

        # formula
	inputframe2 = tkframe(window.ds.gee)
	tkpack(tklabel(inputframe2,text='Formula', width=30),side='left')
	tkpack(tkentry(inputframe2,width=40,textvariable=formulainput_), side='left', pady=c(2,2), padx=c(2,5))

        # family
	inputframe3 = tkframe(window.ds.gee)
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

        # cor structure
	inputframe4 = tkframe(window.ds.gee)
        rbar1 <- tkradiobutton(inputframe4)
        rbexchangable <- tkradiobutton(inputframe4)
        rbindependence <- tkradiobutton(inputframe4)
        rbfixed <- tkradiobutton(inputframe4)
        rbunstructure <- tkradiobutton(inputframe4)
        tkconfigure(rbar1, variable=corstructurerbvalue, value="ar1")
        tkconfigure(rbexchangable, variable=corstructurerbvalue, value="exchangable")
        tkconfigure(rbindependence, variable=corstructurerbvalue, value="independence")
        tkconfigure(rbfixed, variable=corstructurerbvalue, value="fixed")
        tkconfigure(rbunstructure, variable=corstructurerbvalue, value="unstructure")
	tkpack(tklabel(inputframe4,text='ar1', width=12), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbar1,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe4,text='Exchangable', width=12), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbexchangable,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe4,text='Independence', width=12), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbindependence,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe4,text='Fixed', width=12), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbfixed,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe4,text='Unstructure', width=12), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbunstructure,side='left', pady=c(5,5), padx=c(5,10))

        # clusterid
	inputframe5 = tkframe(window.ds.gee)
	tkpack(tklabel(inputframe5,text='Cluster ID', width=30),side='left')
	tkpack(tkentry(inputframe5,width=20,textvariable=clusteridinput_), side='left', pady=c(2,2), padx=c(2,5))

        # startcoeff
	inputframe6 = tkframe(window.ds.gee)
	tkpack(tklabel(inputframe6,text='Start Coefficient', width=30),side='left')
	tkpack(tkentry(inputframe6,width=20,textvariable=startcoeffinput_), side='left', pady=c(2,2), padx=c(2,5))

        # user matrix
	inputframe7 = tkframe(window.ds.gee)
	tkpack(tklabel(inputframe7,text='User Matrix (Fixed Cor. Struc. only)', width=30),side='left')
	tkpack(tkentry(inputframe7,width=20,textvariable=usermatrixinput_), side='left', pady=c(2,2), padx=c(2,5))

        # maxit
	inputframe8 = tkframe(window.ds.gee)
	tkpack(tklabel(inputframe8,text='Max Iterations', width=30),side='left')
	tkpack(tkentry(inputframe8,width=20,textvariable=maxitinput_), side='left', pady=c(2,2), padx=c(2,5))

        # display
	inputframe9 = tkframe(window.ds.gee)
        displayRBtrue <- tkradiobutton(inputframe9)
        displayRBfalse <- tkradiobutton(inputframe9)
        tkconfigure(displayRBtrue, variable=displayRBvalue, value="TRUE")
        tkconfigure(displayRBfalse, variable=displayRBvalue, value="FALSE")
	tkpack(tklabel(inputframe9,text='Display: True', width=20), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(displayRBtrue,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe9,text='Display: False', width=20), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(displayRBfalse,side='left', pady=c(5,5), padx=c(5,10))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.gee),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.gee),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe4)
	tkpack(inputframe5)
	tkpack(inputframe6)
	tkpack(inputframe7)
	tkpack(inputframe8)
	tkpack(inputframe9)
	tkpack(inputframe0)
}

