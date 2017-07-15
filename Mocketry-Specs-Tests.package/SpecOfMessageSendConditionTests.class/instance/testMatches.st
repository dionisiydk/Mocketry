tests
testMatches

	| flag spec result |
	spec := SpecOfMessageSendCondition of: [ flag ] by: (Equal to: true).
	
	flag := true.
	spec should be matches: (MessageSend receiver: #receiver selector: #selector).
	
	flag := false.
	spec should not be matches: (MessageSend receiver: #receiver selector: #selector).
	