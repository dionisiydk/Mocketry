tests
testHasProcessByDefault

	| message |
	message := MockOccurredMessage new.
	
	message where process should be: Processor activeProcess