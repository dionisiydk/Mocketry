validation
validate: occurredMessages
	| actualSender success |
	actualSender := occurredMessages
		detect: [ :each | each hasReturnedValueLike: object ]
		ifNone: [ ^ self validateRequiredSenderFor: occurredMessages ].
		
	success := requiredSender matches: {actualSender}.
	success ifTrue: [ ^ SpecOfValidationResult success ].
	
	^ SpecOfWrongObjectSender spec: self for: occurredMessages wrongSender: actualSender