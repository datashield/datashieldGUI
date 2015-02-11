# Real time ds.heatmapPlot function
rt.ds.heatmapPlot = function(){
	
	# Execute function
	ex.ds.heatmapPlot = function(){
		tkdestroy(window.ds.heatmapPlot)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		type <- toString(tclvalue(typeinput_))
		print(eval(parse(text=   paste0("ds.heatmapPlot('", x , "','" , y , "','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.heatmapPlot = function(){
		tkdestroy(window.ds.heatmapPlot)
	}

	# Draw input window
	window.ds.heatmapPlot = tktoplevel()
	tkwm.title(window.ds.heatmapPlot,'ds.heatmapPlot()')
	inputframe0 = tkframe(window.ds.heatmapPlot)

	xinput_ = tclVar( 'D$LAB_HDL' )
	yinput_ = tclVar( 'D$LAB_TSC' )
	typeinput_ = tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.heatmapPlot)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.heatmapPlot)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.heatmapPlot)
	tkpack(tklabel(inputframe3,text='Type', width=20),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=typeinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.heatmapPlot),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.heatmapPlot),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe0)
}

