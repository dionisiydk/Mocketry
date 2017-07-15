tests
testValidationMessageProcessWhenItOccuredInThisProcess

	mock someMessage.
		
	mock should receive someMessage inThisProcess.
	
	[mock should receive someMessage inAnotherProcess] should raise: SpecOfFailed