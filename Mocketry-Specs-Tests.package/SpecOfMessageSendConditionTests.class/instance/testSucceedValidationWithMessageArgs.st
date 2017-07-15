tests
testSucceedValidationWithMessageArgs

	| spec result |
	spec := SpecOfMessageSendCondition of: [:arg | arg ] by: (Equal to: true).
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selectorWith: argument: true).
	
	result should be isSuccess