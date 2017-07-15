tests
testValidationThatMockReceivedAnyMessage

	[mock should receive anyMessage] should raise: SpecOfFailed.
	
	mock someMessage.
	
	mock should receive anyMessage