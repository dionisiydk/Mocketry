validation
validateRequiredSenderFor: occurredMessages
	| result |
	result := requiredSender validate: occurredMessages.
	result isSuccess ifTrue: [ 
		result := (SpecOfMessageReturnedValue requiredValue: object)
			validate: result occurredMessages last ].
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongObjectSender spec: self for: occurredMessages