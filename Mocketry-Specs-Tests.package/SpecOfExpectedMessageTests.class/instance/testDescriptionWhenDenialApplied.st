tests
testDescriptionWhenDenialApplied

	| spec |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #someMessageWith: argument: #someArg)) not.
	
	spec where description should equal: '#receiver should not receive someMessageWith: #someArg'