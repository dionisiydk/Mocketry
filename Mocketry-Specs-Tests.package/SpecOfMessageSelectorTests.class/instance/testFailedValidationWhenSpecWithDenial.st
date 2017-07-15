tests
testFailedValidationWhenSpecWithDenial

	| spec result |
	spec := (SpecOfMessageSelector requiredValue: #someMessage) not.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage but it should not be "#someMessage"'