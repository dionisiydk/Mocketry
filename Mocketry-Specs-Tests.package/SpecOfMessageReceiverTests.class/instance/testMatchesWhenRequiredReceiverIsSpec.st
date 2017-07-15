tests
testMatchesWhenRequiredReceiverIsSpec

	| spec |
	spec := SpecOfMessageReceiver requiredValue: (Kind of: Number).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 'string' selector: #someMessage).