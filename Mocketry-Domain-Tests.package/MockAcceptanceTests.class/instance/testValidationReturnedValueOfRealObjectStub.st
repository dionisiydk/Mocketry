tests
testValidationReturnedValueOfRealObjectStub

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.
	
	rect area.
	
	rect should receive area which should equal: 6