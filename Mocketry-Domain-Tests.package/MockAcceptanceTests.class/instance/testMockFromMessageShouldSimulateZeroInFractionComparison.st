tests
testMockFromMessageShouldSimulateZeroInFractionComparison
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1/2 > returnedMock.
	result should be: true.
	returnedMock should equal: 0