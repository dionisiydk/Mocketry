tests
testValidationReceivedMessageWhenBehaviourChanged

	mock := Mock new.
	mock stub someMessage willReturn: #result.

	mock someMessage.	
	MockCurrentBehaviour value: nil.
	
	mock should receive someMessage