tests
testValidationMessagesCountByExactly
		
	mock someMessage.
	mock someMessage.
	
	[mock should receive someMessage exactly: 1] should raise: SpecOfFailed.
	mock should receive someMessage exactly: 2.
	[mock should receive someMessage exactly: 3] should raise: SpecOfFailed