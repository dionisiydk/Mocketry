tests
testDelegatingMessagesToFirstValue

	| arg |
	
	arg := self prepareCapture.
	
	arg values: {2@3}.
	
	arg x should be: 2