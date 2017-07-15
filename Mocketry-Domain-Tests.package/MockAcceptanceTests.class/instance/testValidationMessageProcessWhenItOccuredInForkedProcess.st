tests
testValidationMessageProcessWhenItOccuredInForkedProcess

	[mock someMessage] fork.
	20 milliSeconds wait.
		
	mock should receive someMessage inAnotherProcess.	
	[mock should receive someMessage inThisProcess] should raise: SpecOfFailed