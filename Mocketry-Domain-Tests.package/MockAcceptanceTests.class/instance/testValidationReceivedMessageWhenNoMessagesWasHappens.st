tests
testValidationReceivedMessageWhenNoMessagesWasHappens
	
	mock should not receive someMessage.
	[mock should receive someMessage] should raise: SpecOfFailed