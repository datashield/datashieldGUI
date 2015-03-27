# Real time ds.tTest function
rt.ds.tTest = function(){
	
	# Execute function
	ex.ds.tTest = function(){
		tkdestroy(window.ds.tTest)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		type <- toString(tclvalue(typeRBvalue))
		alternative <- toString(tclvalue(hypRBvalue))
		mu <- toString(tclvalue(mu))
		paired <- toString(tclvalue(pairedRBvalue))
		var.equal <- toString(tclvalue(equvarRBvalue))
		conf.level <- toString(tclvalue(conflevel))
                ds_command <- parse(text=sprintf("ds.tTest(x='%s', y='%s', type='%s', alternative='%s', mu=%s, paired=%s, var.equal=%s, conf.level=%s)", x, y, type, alternative, mu, paired, var.equal, conf.level))
                print(eval(ds_command))
	}
        # In other functions the construction of the datashield command is
        # done in one step and uses 'paste0' rather than 'sprintf'.
        #
        # Any arguments of the datashield command that are not strings (for
        # example numbers such as 'conf.level' or booleans such as 'paired')
        # must not have single quotes around them. Otherwise they are evaluated
        # incorrectly.
        #
        # Using paste0 makes the difference in quoting hard to read.
        # For example here is the equivalent line, using paste0:
        #
        # print(eval(parse(text=   paste0("ds.tTest('", x , "','" , y , "','", type ,"','", alternative ,"',", mu ,",", paired ,",", var.equal ,",", conf.level ,")" , sep="")   )))
        #

	# Cancel function
	cl.ds.tTest = function(){
		tkdestroy(window.ds.tTest)
	}

	# Draw input window
	window.ds.tTest = tktoplevel()
	tkwm.title(window.ds.tTest,'ds.tTest()')
	inputframe0 = tkframe(window.ds.tTest)

	xinput_ = tclVar( 'variable_name' )
	yinput_ = tclVar( 'variable_name' )
	conflevel = tclVar( '0.95' )
	typeRBvalue <- tclVar( 'combine' )
	hypRBvalue <- tclVar( 'two.sided' )
	mu = tclVar( '0' )
	pairedRBvalue <- tclVar( 'FALSE' )
	equvarRBvalue <- tclVar( 'FALSE' )

	inputframe1 = tkframe(window.ds.tTest)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=20,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.tTest)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=20,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.tTest)
        # type
        rbsplt <- tkradiobutton(inputframe3)
        rbcomb <- tkradiobutton(inputframe3)
        tkconfigure(rbsplt, variable=typeRBvalue, value="split")
        tkconfigure(rbcomb, variable=typeRBvalue, value="combine")
	tkpack(tklabel(inputframe3,text='Split', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(rbsplt,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe3,text='Combine', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(rbcomb,side='left', pady=c(5,5), padx=c(5,10))

	inputframe4 = tkframe(window.ds.tTest)
        # confidence
	tkpack(tklabel(inputframe4,text='Confidence level', width=20),side='left')
	tkpack(tkentry(inputframe4,width=20,textvariable=conflevel), side='left', pady=c(2,2), padx=c(2,5))

	inputframe5 = tkframe(window.ds.tTest)
        # hypothesis
        hypRBtwosided <- tkradiobutton(inputframe5)
        hypRBgreater <- tkradiobutton(inputframe5)
        hypRBless <- tkradiobutton(inputframe5)
        tkconfigure(hypRBtwosided, variable=hypRBvalue, value="two.sided")
        tkconfigure(hypRBgreater, variable=hypRBvalue, value="greater")
        tkconfigure(hypRBless, variable=hypRBvalue, value="less")
	tkpack(tklabel(inputframe5,text='Two-sided', width=10), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(hypRBtwosided,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe5,text='Greater', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(hypRBgreater,side='left', pady=c(5,5), padx=c(5,10))
	tkpack(tklabel(inputframe5,text='Less', width=10), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(hypRBless,side='left', pady=c(5,5), padx=c(5,10))

	inputframe6 = tkframe(window.ds.tTest)
        # mu
	tkpack(tklabel(inputframe6,text='mu', width=20),side='left')
	tkpack(tkentry(inputframe6,width=20,textvariable=mu), side='left', pady=c(2,2), padx=c(2,5))

	inputframe7 = tkframe(window.ds.tTest)
        # paired
        pairedRBtrue <- tkradiobutton(inputframe7)
        pairedRBfalse <- tkradiobutton(inputframe7)
        tkconfigure(pairedRBtrue, variable=pairedRBvalue, value="TRUE")
        tkconfigure(pairedRBfalse, variable=pairedRBvalue, value="FALSE")
	tkpack(tklabel(inputframe7,text='Paired', width=15), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(pairedRBtrue,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe7,text='Non-paired', width=15), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(pairedRBfalse,side='left', pady=c(5,5), padx=c(5,10))

	inputframe8 = tkframe(window.ds.tTest)
        # variance
        equvarRBtrue <- tkradiobutton(inputframe8)
        equvarRBfalse <- tkradiobutton(inputframe8)
        tkconfigure(equvarRBtrue, variable=equvarRBvalue, value="TRUE")
        tkconfigure(equvarRBfalse, variable=equvarRBvalue, value="FALSE")
	tkpack(tklabel(inputframe8,text='Equal variance', width=15), side='left', pady=c(5,5), padx=c(10,5))
        tkpack(equvarRBtrue,side='left', pady=c(5,5), padx=c(5,5))
	tkpack(tklabel(inputframe8,text='Unequal variance', width=15), side='left', pady=c(5,5), padx=c(5,5))
        tkpack(equvarRBfalse,side='left', pady=c(5,5), padx=c(5,10))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.tTest),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.tTest),side='left', pady=c(10,10) , padx=c(5,10))

        inputframe9 = tkframe(window.ds.tTest)
        tkpack(tklabel(inputframe9,text='Advanced', width=10), side='left', pady=c(20,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe9)
	tkpack(inputframe4)
	tkpack(inputframe6)
	tkpack(inputframe7)
	tkpack(inputframe8)
	tkpack(inputframe5)
	tkpack(inputframe0)
}

