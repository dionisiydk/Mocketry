tests
testValidationReceivedMessageWhenBehaviourChanged

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: #result.
	rect area should be: #result.
	
	MockCurrentBehaviour value: nil.
	
	rect should receive area