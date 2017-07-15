validation
validate: aMessageSend 
	| subject |
	subject := subjectBlock valueWithEnoughArguments: aMessageSend arguments.
	
	^(conditionSpec validate: subject)