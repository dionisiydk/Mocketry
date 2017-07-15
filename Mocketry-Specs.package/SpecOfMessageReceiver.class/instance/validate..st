validation
validate: aMessageSend

	| result |
	result := requiredValue validate: aMessageSend receiver.
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongMessageReceiver of: aMessageSend spec: self