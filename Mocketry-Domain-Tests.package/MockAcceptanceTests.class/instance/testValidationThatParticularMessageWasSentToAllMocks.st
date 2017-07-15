tests
testValidationThatParticularMessageWasSentToAllMocks

	| mock2 |
	mock someMessage.
	mock2 := Mock new.
		
	[Any should receive someMessage] should raise: SpecOfFailed.

	mock2 someMessage.
	
	Any should receive someMessage	