tests
testFailedValidationWithMessageArgs

	| spec result |
	spec := SpecOfMessageSendCondition of: [:arg | arg ] by: (Equal to: true).
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selectorWith: argument: false).
	
	result should be isFailure