tests
testApplyingShouldWhenMessageSpecDefinedButNoArgumentCaptured

	| arg |
	
	arg := self prepareCapture.
	
	arg values: #().
	
	[arg should] should fail