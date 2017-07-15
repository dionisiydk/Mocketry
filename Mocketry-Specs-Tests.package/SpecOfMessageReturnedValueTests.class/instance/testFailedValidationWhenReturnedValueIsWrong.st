tests
testFailedValidationWhenReturnedValueIsWrong

	| spec message result |
	spec := SpecOfMessageReturnedValue requiredValue: #requiredValue.	
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: #actualValue asOccurredMessageResult.	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got "#actualValue" from #receiver selector but it should equal "#requiredValue"'