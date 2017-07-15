tests
testValidationMessagesCountByAtMost

	mock someMessage.
		
	mock should receive someMessage atMost: 1.
	
	mock someMessage.
	[mock should receive someMessage atMost: 1] should raise: SpecOfFailed