tests
testSucceedValidation

	| spec result |
	spec := SpecOfAsynchMessage forActiveProcess.
	
	result := spec validate: (MockOccurredMessage new process: Process new).
	
	result should be isSuccess