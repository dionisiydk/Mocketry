tests
testFailedValidationWhenRaisedErrorIsWrong

	| spec message result |
	spec := SpecOfMessageRaisedException requiredValue: #requiredExc.
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: (MockOccurredExceptionSignal exception: #wrongExc).	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got raised #wrongExc from #receiver selector but it should equal "#requiredExc"'