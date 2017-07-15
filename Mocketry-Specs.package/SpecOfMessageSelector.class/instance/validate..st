validation
validate: aMessageSend

	| result |
	result := requiredValue validate: aMessageSend selector.
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongMessageSelector of: aMessageSend spec: self