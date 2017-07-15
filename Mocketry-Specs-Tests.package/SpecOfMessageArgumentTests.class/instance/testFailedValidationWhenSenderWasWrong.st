tests
testFailedValidationWhenSenderWasWrong

	| spec result |
	spec := SpecOfMessageArgument number: 2 requiredValue: 10.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage:with:with: arguments: {5. 6. 7}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 with: 6 with: 7 but arg 2 should equal "10"'