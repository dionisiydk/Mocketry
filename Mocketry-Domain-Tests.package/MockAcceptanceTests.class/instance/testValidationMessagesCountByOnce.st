tests
testValidationMessagesCountByOnce

	mock someMessage.
	
	mock should receive someMessage once.
	
	mock someMessage.
	
	[mock should receive someMessage once] should raise: SpecOfFailed.