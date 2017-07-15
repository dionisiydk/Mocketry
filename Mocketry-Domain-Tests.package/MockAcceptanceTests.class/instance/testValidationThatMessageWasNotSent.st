tests
testValidationThatMessageWasNotSent
	
	mock someMessage2.
	
	mock should not receive someMessage.
	
	mock someMessage.
	
	[mock should not receive someMessage] should raise: SpecOfFailed