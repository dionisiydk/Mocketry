tests
testMockFromMessageShouldSimulateZeroInIntegerArithmetics
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1 + returnedMock.
	result should equal: 1.
	returnedMock should equal: 0