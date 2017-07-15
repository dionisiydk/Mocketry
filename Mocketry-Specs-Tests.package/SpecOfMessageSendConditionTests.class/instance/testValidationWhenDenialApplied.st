tests
testValidationWhenDenialApplied

	| flag spec result |
	spec := (SpecOfMessageSendCondition of: [ flag ] by: (Equal to: true)) not.
	flag := false.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selector).
	
	result should be isSuccess