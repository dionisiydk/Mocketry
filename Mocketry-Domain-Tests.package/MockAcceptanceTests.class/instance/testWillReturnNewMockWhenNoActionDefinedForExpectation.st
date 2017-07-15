tests
testWillReturnNewMockWhenNoActionDefinedForExpectation

	| actual |	
	mock stub someMessage.
	
	actual := mock someMessage.
	
	actual should beInstanceOf: MockForMessageReturn