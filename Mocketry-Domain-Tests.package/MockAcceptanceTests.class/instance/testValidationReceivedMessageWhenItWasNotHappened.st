tests
testValidationReceivedMessageWhenItWasNotHappened

	mock someMessage.
	
	mock should not receive unexpectedMessage.
	[mock should receive unexpectedMessage] should raise: SpecOfFailed