tests
testDescription

	| spec |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #someMessageWith: argument: #someArg).
	
	spec where description should equal: '#receiver should receive someMessageWith: #someArg'