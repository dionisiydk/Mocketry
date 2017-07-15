tests
testSucceedValidation

	| spec result |
	spec := SpecOfMessageSelector requiredValue: #someMessage.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	result should be isSuccess