tests
testValidationThatRealObjectMessageWasNotSent
	
	| rect |
	rect := 0@1 corner: 10@30.
	rect stub.
	
	rect should not receive width.
	
	rect area.
	
	[rect should not receive width] should raise: SpecOfFailed