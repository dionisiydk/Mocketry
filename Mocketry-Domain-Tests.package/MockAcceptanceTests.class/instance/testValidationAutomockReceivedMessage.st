tests
testValidationAutomockReceivedMessage

	| autoMock |
	autoMock := mock someMessage.
	
	[autoMock should receive someMessage2] should raise: SpecOfFailed.
	
	autoMock someMessage2.
	
	autoMock should receive someMessage2