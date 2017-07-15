tests
testValidationThatMockReceivedAnyMessageWhenHappenedMessageHadArguments
	 
	[mock should receive anyMessage] should raise: SpecOfFailed.
	
	mock someMessageWith: 1.
	
	mock should receive anyMessage