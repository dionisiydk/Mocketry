tests
testFailedValidationWhenSenderWasWrong

	| spec result |
	spec := SpecOfAsynchMessage forActiveProcess.
	
	result := spec validate: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	result should be isFailure.
	result where description should equal: '#receiver should receive selector in another process'