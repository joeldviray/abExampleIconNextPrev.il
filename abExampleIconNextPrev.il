procedure(abCreateExampleIconNextPrevForm(listOfPictures)
	let((next previous picture thisPicture)
		next=hiCreateButton(
			?name 'next
			?buttonIcon list(cdsGetInstPath("/home/jviray/.skill_jv/jvTool/images/bevel/bottom_boundary.png") 67 65)
			?callback "abExampleIconNextCB(hiGetCurrentForm())"
		)
		previous=hiCreateButton(
			?name 'previous
			?buttonIcon list(cdsGetInstPath("/home/jviray/.skill_jv/jvTool/images/bevel/bottom_corner.png") 67 65)
			?callback "abExampleIconPreviousCB(hiGetCurrentForm())"
		)
		thisPicture=car(listOfPictures)
		picture=hiCreateButton(
			?name 'picture
			?buttonIcon list(cdsGetInstPath(strcat("/home/jviray/.skill_jv/jvTool/images/bevel/" car(thisPicture)))
			cadr(thisPicture) caddr(thisPicture))
			?callback "abExampleIconPictureCB(hiGetCurrentForm())"
		)
		
		hiCreateAppForm(
			?formTitle "Next Previous Example"
			?name 'abExampleIconNextPrevForm	
			?fields
				list(
					list(previous 20:20 20:20)
					list(picture 60:0 60:60)
					list(next 140:20 20:20)
				)
		)
		
		abExampleIconNextPrevForm->listOfPictures=listOfPictures
		abExampleIconNextPrevForm->thisPicture=thisPicture
		abExampleIconNextPrevForm
	);let
);procedure


procedure(abExampleIconNextPrev()
	let((listOfPictures)
		listOfPictures=
			'(
				("left_boundary.png" 48 48 "MyPlotWaveform()")
				("left_fill.png" 48 48 "MyOutputSetup()")
				("left_other.png" 48 48 "MyDelete()")
				("left_tap.png" 48 48 "MyVariableEdit()")
			)
		hiDisplayForm(abCreateExampleIconNextPrevForm(listOfPictures))
		);let
);procedure


procedure(MyPlotWaveform() 
	printf("Plotting a waveform\n") 
)

procedure(MyOutputSetup() 
	printf("Output Setup pushed\n") 
)

procedure(MyDelete() 
	printf("Delete the lot\n") 
) 

procedure(MyVariableEdit() 
	printf("Variable Edit engaged\n") 
)
