tests
testSucceedValidation

	| spec message result |
	spec := SpecOfMessageReturnedValue requiredValue: #returnedValue.	
	message := MockOccurredMessage new.
	
	message result: #returnedValue asOccurredMessageResult.	
	result := spec validate: message.
	
	result should be isSuccess