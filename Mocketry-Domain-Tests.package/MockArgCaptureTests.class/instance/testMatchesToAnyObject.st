tests
testMatchesToAnyObject

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	(arg basicMatches: Any) should be: true