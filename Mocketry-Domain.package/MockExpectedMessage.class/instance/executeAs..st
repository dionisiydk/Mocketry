evaluating
executeAs: aMessageSend

	spec captureArgumentsFrom: aMessageSend.
	(conditionsSpec validate: aMessageSend) raise.

	usageCount := usageCount + 1.
	^actions executeFor: aMessageSend