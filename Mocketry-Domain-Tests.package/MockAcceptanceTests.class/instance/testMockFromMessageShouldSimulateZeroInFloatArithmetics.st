tests
testMockFromMessageShouldSimulateZeroInFloatArithmetics
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1.0 + returnedMock.
	result should equal: 1.0.
	returnedMock should equal: 0.0