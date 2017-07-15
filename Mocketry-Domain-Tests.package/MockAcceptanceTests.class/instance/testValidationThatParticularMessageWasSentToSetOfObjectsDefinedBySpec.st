tests
testValidationThatParticularMessageWasSentToSetOfObjectsDefinedBySpec

	| mock2 |
	[(Instance of: Mock) should receive someMessage] should raise: SpecOfFailed.

	mock someMessage.
	mock2 := Mock new.

	[(Instance of: Mock) should receive someMessage] should raise: SpecOfFailed.	

	mock2 someMessage.
	
	(Instance of: Mock) should receive someMessage	