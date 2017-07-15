tests
testMatchesWhenSymbolSelector

	| spec |
	spec := SpecOfMessageSelector requiredValue: #someMessage.
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: #anotherMessage).