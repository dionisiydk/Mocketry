tests
testMatchesWhenSpecWithDenial

	| spec |
	spec := (SpecOfMessageReceiver requiredValue: 1) not.
	
	spec should be matches: (MockOccurredMessage receiver: 2 selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).