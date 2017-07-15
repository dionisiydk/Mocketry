tests
testValidationMessagesCountByAtLeastAtMost

	mock someMessage.
	mock someMessage.
		
	mock should receive someMessage atLeast: 2 atMost: 3.
	
	mock someMessage.
	mock someMessage.
	
	[mock should receive someMessage atLeast: 2 atMost: 3] should raise: SpecOfFailed