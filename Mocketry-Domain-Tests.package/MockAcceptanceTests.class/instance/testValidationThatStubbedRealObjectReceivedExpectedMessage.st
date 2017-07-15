tests
testValidationThatStubbedRealObjectReceivedExpectedMessage

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: 100.
	
	rect area.
	
	rect should receive area