tests
testFailedValidationWhenDenialApplied

	| spec message result |
	spec := (SpecOfMessageReturnedValue requiredValue: #requiredValue) not.	
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: #requiredValue asOccurredMessageResult.	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got "#requiredValue" from #receiver selector but it should not equal "#requiredValue"'