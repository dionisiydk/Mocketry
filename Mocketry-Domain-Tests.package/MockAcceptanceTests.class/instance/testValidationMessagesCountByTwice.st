tests
testValidationMessagesCountByTwice

	mock someMessage.
	mock someMessage.
	
	mock should receive someMessage twice.
	
	mock someMessage.
	[mock should receive someMessage twice] should raise: SpecOfFailed.