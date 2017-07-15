tests
testApplyingShouldWhenMultipleDifferentArgsWasCaptured

	| arg |
	
	arg := self prepareCapture.	
	arg values: #(arg1).
	
	[arg should] should not fail.

	arg values: #(arg1 arg2).	
	
	[arg should] should fail