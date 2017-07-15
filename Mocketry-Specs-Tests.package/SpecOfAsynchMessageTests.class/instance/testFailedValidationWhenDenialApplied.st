tests
testFailedValidationWhenDenialApplied

	| spec result |
	spec := SpecOfAsynchMessage forActiveProcess not.
	
	result := spec validate: ((MockOccurredMessage receiver: #receiver selector: #selector) process: Process new).
	
	result should be isFailure.
	result where description should equal: '#receiver should receive selector in original process'