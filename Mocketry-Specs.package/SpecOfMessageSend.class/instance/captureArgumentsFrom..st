capturing arguments
captureArgumentsFrom: aMessageSend

	self arguments withIndexDo: [ :argSpec :argIndex | | argValue |
		argValue := aMessageSend arguments at: argIndex.
		argSpec captureValue: argValue]