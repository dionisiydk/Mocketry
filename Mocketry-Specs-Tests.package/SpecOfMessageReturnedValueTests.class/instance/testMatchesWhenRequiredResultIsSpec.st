tests
testMatchesWhenRequiredResultIsSpec

	| spec message |
	spec := SpecOfMessageReturnedValue requiredValue: (Kind of: Number).	
	message := MockOccurredMessage new.
	
	message result: 1 asOccurredMessageResult.	
	spec should be matches: message.
	
	message result: 'string' asOccurredMessageResult.
	spec should not be matches: message