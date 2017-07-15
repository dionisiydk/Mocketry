tests
testFailedValidationWhenDenialApplied

	| spec message result |
	spec := (SpecOfMessageRaisedException requiredValue: #requiredExc) not.
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got raised #requiredExc from #receiver selector but it should not equal "#requiredExc"'