tests
testValidationReceivedMessageWhenBehaviourChanged2

	mock := Mock new.
	mock stub someMessage willReturn: #result.

	MockCurrentBehaviour value: nil.
	mock someMessage.
	
	mock should receive someMessage