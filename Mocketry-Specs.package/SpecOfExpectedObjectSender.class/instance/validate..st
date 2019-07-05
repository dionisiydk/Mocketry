validation
validate: occurredMessages
	| actualSenders success |
	actualSenders := occurredMessages	select: [ :each | each hasReturnedValueLike: object ].
	actualSenders ifEmpty: [ ^ self validateRequiredSenderFor: occurredMessages ].
	
	success := requiredSender matches: actualSenders.
	success ifTrue: [ ^ SpecOfValidationResult success ].
	
	^ SpecOfWrongObjectSender spec: self for: occurredMessages wrongSender: actualSenders last