tests
testFailedValidationWhenThereIsNoRequiredArgumentAndSpecWithDenial

	| spec result |
	spec := (SpecOfMessageArgument number: 2 requiredValue: 10) not.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage: arguments: {5}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 but it should have arg 2 which should not equal "10"'