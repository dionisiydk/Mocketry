tests
testValidationReceivedMessageWhenBehaviourChanged2

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: #result.
	
	MockCurrentBehaviour value: nil.
	rect area should be: #result.
	
	rect should receive area