tests
testMatchesWhenRequiredArgumentIsSpec

	| spec |
	spec := SpecOfMessageArgument number: 2 requiredValue: (Kind of: Number).
	
	spec should be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 1. Any}).

	spec should not be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'string'. Any}).