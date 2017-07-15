tests
testDescriptionWhenMessageShouldBeSentMoreThanOneTime

	| spec |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #someMessageWith: argument: #someArg).
	spec usage minCount: 2.
	
	spec where description should equal: '#receiver should receive someMessageWith: #someArg at least 2 times'