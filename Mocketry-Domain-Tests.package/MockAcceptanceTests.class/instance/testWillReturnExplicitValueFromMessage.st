tests
testWillReturnExplicitValueFromMessage

	| actual |
	mock stub someMessage willReturn: #result.
	
	actual := mock someMessage.
	
	actual should be: #result