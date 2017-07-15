tests
testReturnFromMessageSeveralTimes

	| actual actual2 |
	mock stub someMessage willReturn: #result.
	
	actual := mock someMessage.
	actual should be: #result.
	
	actual2 := mock someMessage.
	actual2 should be: #result