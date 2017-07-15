tests
testApplyingShouldWhenNoMessageSpecDefined

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	[arg should] should fail