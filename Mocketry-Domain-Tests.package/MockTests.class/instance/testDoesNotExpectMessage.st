tests
testDoesNotExpectMessage

	| returnedMock unexpectedMessage mockHash |
	unexpectedMessage := MockOccurredMessage receiver: mock selector: #someMessage.
	mock ghostBehaviour: mock ghostBehaviour copy.
	
	returnedMock := mock stubDoesNotExpect: unexpectedMessage.
	
	returnedMock should beInstanceOf: MockForMessageReturn.
	returnedMock ghostBehaviour should be: mock ghostBehaviour.
	returnedMock mockOwnerMessage should be: unexpectedMessage.
	mockHash := returnedMock ghostIdentityHash.
	returnedMock ghostPrintString should equal: 'Result(', mockHash asString, ') of: a Mock(mock) someMessage'.