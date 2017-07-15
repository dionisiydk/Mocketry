tests
testMatchesWhenExplicitArgumentValue

	| spec |
	spec := SpecOfMessageArgument number: 2 requiredValue: 'requiredArgument'.
	
	spec should be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'requiredArgument'. Any}).
	
	spec should be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'requiredArgument' copy. Any}).
	
	spec should not be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'wrongArgument'. Any}).

	spec should not be matches: (MockOccurredMessage receiver: Any selector: #someMessage: arguments: {Any}).
