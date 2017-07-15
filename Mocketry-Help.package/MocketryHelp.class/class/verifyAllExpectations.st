pages
verifyAllExpectations
	^ HelpTopic 
		title: 'Verify all expectations'
		contents:
'There is way how to verify that all defined expectations were occurred

	mock1 := Mock new.
	mock2 := Mock new.
	[mock1 someMessage. mock2 someMessage2]
	   should lenient satisfy:
	[ mock2 someMessage2.
	mock1 someMessage willReturn: ''some''].

#lenient means that we dont care about order in which expected messages were happened.

	mock1 := Mock new.
	mock2 := Mock new.
	[mock1 someMessage. mock2 someMessage2]
	   should strict satisfy:
	[ mock1 someMessage willReturn: ''some''.
	mock2 someMessage2].

#strict means that we want expected messages were happened in same order in which they were defined.
'