tests
testMockFromMessageShouldSimulateZeroInFractionArithmetics
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1/2 + returnedMock.
	result should equal: 1/2.
	returnedMock should equal: 0