tests
testValidationThatAnyMessageWasSentToAnyMock

	[Any should receive anyMessage] should raise: SpecOfFailed.
	
	mock someMessage.
	
	Any should receive anyMessage