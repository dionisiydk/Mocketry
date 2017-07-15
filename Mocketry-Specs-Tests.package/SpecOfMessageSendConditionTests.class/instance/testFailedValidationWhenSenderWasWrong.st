tests
testFailedValidationWhenSenderWasWrong

	| flag spec result |
	spec := SpecOfMessageSendCondition of: [ flag ] by: (Equal to: #done).
	flag := #wrong.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selector).
	
	result should be isFailure.
	result where spec should be: spec conditionSpec.
	result where subject should be: #wrong