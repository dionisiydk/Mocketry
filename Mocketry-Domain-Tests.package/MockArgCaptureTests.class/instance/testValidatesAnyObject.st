tests
testValidatesAnyObject

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	(arg validate: Any) should be: SpecOfValidationResult success