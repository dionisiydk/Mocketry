tests
testFailedValidationWhenSenderWasWrong
	
	| spec message result |
	spec := SpecOfExpectedObjectSender for: #object returnedFrom: (
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)).

	message := MockOccurredMessage receiver: #receiver2 selector: #selector.
	message result: #object asOccurredMessageResult.
	
	result := spec validate: { message }.
	
	result should be isFailure.
	result where description should equal: '#object was returned from #receiver2 selector but it should be #receiver selector'