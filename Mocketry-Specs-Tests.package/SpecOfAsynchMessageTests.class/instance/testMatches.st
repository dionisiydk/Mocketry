tests
testMatches

	| spec |
	spec := SpecOfAsynchMessage forActiveProcess.
	
	spec should be matches: (MockOccurredMessage new process: Process new).

	spec should not be matches: (MockOccurredMessage new).
