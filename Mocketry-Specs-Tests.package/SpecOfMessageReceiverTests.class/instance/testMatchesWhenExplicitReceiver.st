tests
testMatchesWhenExplicitReceiver

	| spec |
	spec := SpecOfMessageReceiver requiredValue: 'requiredReceiver'.
	
	spec should be matches: (MockOccurredMessage receiver: 'requiredReceiver' selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 'requiredReceiver' copy selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 'wrongReceiver' selector: #someMessage).