tests
testReturnFromMessageSeveralTimesWhenForEachTimeThereIsSpecificExpectation

	mock stub someMessage willReturn: #initialResult.
	mock stub someMessage willReturn: #newResult; useTwice.

	mock someMessage should be: #newResult.	
	mock someMessage should be: #newResult.
	
	mock someMessage should be: #initialResult
