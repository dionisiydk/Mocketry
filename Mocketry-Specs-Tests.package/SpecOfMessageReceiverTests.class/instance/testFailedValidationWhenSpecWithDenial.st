tests
testFailedValidationWhenSpecWithDenial

	| spec result |
	spec := (SpecOfMessageReceiver requiredValue: 2) not.

	result := spec validate: (MockOccurredMessage receiver: 2 selector: #someMessage).
	
	result should be isFailure.
	result where description should equal: 'someMessage is sent to "2" but it should not be "2"'