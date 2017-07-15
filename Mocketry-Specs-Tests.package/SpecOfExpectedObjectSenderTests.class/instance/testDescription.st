tests
testDescription
	
	| spec |
	spec := SpecOfExpectedObjectSender for: #object returnedFrom: (
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)).

	spec where description should equal: '#object should be returned from #receiver selector'