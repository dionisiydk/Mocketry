tests
testFailedValidationWhenSenderWasWrong

	| spec result |
	spec := SpecOfMessageSelector requiredValue: #someMessage.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #anotherMessage).
	
	result should be isFailure.
	result where description should equal: '1 received anotherMessage but it should be "#someMessage"'