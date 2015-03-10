# Real time ds.assign function
rt.ds.assign = function(){
	
	# Execute function
	ex.ds.assign = function(){
		tkdestroy(window.ds.assign)
		toAssign <- toString(tclvalue(xinput_))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.assign('", toAssign , "','", newobj ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.assign = function(){
		tkdestroy(window.ds.assign)
	}

	# Draw input window
	window.ds.assign = tktoplevel()
	tkwm.title(window.ds.assign,'ds.assign()')
	inputframe0 = tkframe(window.ds.assign)

	xinput_ = tclVar( 'D$LAB_HDL' )
	newobjinput_ = tclVar( 'new_obj' )

	inputframe1 = tkframe(window.ds.assign)
	tkpack(tklabel(inputframe1,text='toAssign', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.assign)
	tkpack(tklabel(inputframe2,text='New Object', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.assign),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.assign),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

