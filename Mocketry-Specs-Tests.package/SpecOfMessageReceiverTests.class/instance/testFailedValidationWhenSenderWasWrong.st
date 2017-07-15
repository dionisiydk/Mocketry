tests
testFailedValidationWhenSenderWasWrong

	| spec result |
	spec := SpecOfMessageReceiver requiredValue: 2.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	result should be isFailure.
	result where description should equal: 'someMessage is sent to "1" but it should be "2"'