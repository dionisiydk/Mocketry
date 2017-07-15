tests
testWillRaiseErrorFromMessage

	| error |
	error := Error new.
	mock stub someMessage willRaise: error.
	
	[mock someMessage] should raise: error