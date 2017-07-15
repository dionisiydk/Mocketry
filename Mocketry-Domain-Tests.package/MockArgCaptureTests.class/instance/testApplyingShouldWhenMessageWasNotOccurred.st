tests
testApplyingShouldWhenMessageWasNotOccurred

	| arg |
	
	arg := self prepareCapture.
	arg messageSpec selector requiredValue: #wrongSelector.
	
	arg values: #().
	
	[arg should] should raise: SpecOfFailed