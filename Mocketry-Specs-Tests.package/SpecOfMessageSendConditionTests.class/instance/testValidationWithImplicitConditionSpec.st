tests
testValidationWithImplicitConditionSpec

	| spec result flag |
	spec := SpecOfMessageSendCondition of: [flag ] by: true.
	flag := true.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selectorWith: argument: true).
	
	result should be isSuccess