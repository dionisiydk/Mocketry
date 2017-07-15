validation
validate: occurredMessages

	| uncheckedMessages result allOccurred validMessages |
	allOccurred := super validate: occurredMessages.
	allOccurred isFailure ifTrue: [^allOccurred].
	
	uncheckedMessages := OrderedCollection withAll: occurredMessages.
	validMessages := OrderedCollection new.

	expectedMessages do: [ :eachSpec |
	
		result := eachSpec validate: uncheckedMessages.
		
		result isFailure ifTrue: [ ^SpecOfWrongMessagesOrder of: occurredMessages spec: self validMessages: validMessages wrongMessage: eachSpec].
		result requiredOccurredMessages ifNotEmpty: [:required |
			validMessages addAll: required.
			uncheckedMessages := uncheckedMessages copyAfter: required last].
	].
	
	^SpecOfValidationResult success