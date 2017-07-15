tests
testMatchesWhenSpecSelector

	| spec |
	spec := SpecOfMessageSelector requiredValue: (Kind of: Symbol).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #anotherMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: 'stringSelector').