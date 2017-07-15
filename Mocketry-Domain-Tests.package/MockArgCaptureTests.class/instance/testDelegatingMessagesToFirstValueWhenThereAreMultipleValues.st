tests
testDelegatingMessagesToFirstValueWhenThereAreMultipleValues

	| arg |
	
	arg := self prepareCapture.
	
	arg values: {2@3. 10@20}.
	
	[arg x] should fail