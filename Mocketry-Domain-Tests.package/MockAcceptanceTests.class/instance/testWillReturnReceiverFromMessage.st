tests
testWillReturnReceiverFromMessage

	| actual |
	mock stub someMessage willReturnYourself.
	
	actual := mock someMessage.
	
	actual should be: mock