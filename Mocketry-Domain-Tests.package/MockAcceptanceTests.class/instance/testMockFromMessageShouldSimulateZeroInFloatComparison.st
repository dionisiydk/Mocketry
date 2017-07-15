tests
testMockFromMessageShouldSimulateZeroInFloatComparison
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1.0 > returnedMock.
	result should be: true.
	returnedMock should equal: 0.0