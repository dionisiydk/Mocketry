tests
testMockFromMessageShouldSimulateZeroInIntegerComparison
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1 > returnedMock.
	result should be: true.
	returnedMock should equal: 0