tests
testSucceedValidation

	| spec result |
	spec := SpecOfMessageReceiver requiredValue: 2.

	result := spec validate: (MockOccurredMessage receiver: 2 selector: #someMessage).
	
	result should be isSuccess