tests
testSucceedValidation

	| flag spec result |
	spec := SpecOfMessageSendCondition of: [ flag ] by: (Equal to: true).
	flag := true.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selector).
	
	result should be isSuccess