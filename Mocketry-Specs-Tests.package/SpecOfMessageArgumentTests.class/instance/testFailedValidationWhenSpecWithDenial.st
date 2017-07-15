tests
testFailedValidationWhenSpecWithDenial

	| spec result |
	spec := (SpecOfMessageArgument number: 2 requiredValue: 10) not.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage:with:with: arguments: {5. 10. 7}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 with: 10 with: 7 but arg 2 should not equal "10"'