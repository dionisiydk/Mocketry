tests
testMatchesWhenSpecWithDenial

	| spec |
	spec := (SpecOfMessageSelector requiredValue: #someMessage) not.
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #anotherMessage).