tests
testValidationMessagesCountByAtLeast
		
	mock someMessage.
	
	[mock should receive someMessage atLeast: 2] should raise: SpecOfFailed.
	
	mock someMessage.
	mock should receive someMessage atLeast: 2.
	mock someMessage.
	mock should receive someMessage atLeast: 2.