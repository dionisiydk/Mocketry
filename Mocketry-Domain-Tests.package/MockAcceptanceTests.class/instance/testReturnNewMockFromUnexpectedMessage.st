tests
testReturnNewMockFromUnexpectedMessage

	| actual mockHash |	
	actual := mock someMessage.
	
	actual should beInstanceOf: MockForMessageReturn.
	mockHash := actual ghostIdentityHash.
	actual ghostPrintString should equal: 'Result(', mockHash asString, ') of: a Mock(mock) someMessage'