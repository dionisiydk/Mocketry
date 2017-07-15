testing
basicMatches: aMessageSend

	| subject |
	subject := subjectBlock valueWithEnoughArguments: aMessageSend arguments.
	^(conditionSpec matches: subject)