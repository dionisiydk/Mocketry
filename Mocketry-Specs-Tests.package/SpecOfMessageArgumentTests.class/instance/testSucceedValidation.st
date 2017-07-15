tests
testSucceedValidation

	| spec result |
	spec := SpecOfMessageArgument number: 2 requiredValue: 10.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage:with:with: arguments: {5. 10. 7}).
	
	result should be isSuccess