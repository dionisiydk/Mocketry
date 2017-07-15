validation
validate: occurredMessages

	| uncheckedMessages failedSpecs result |
	uncheckedMessages := OrderedCollection withAll: occurredMessages.
	failedSpecs := OrderedCollection new.
	
	expectedMessages do: [ :each |
		
		result := each validate: uncheckedMessages.
		result isSuccess 
			ifTrue: [ uncheckedMessages removeAll: result requiredOccurredMessages ]
			ifFalse: [ failedSpecs add: each ]].
		
	failedSpecs ifEmpty: [ ^SpecOfMessagesValidationSuccess occurredMessages: (occurredMessages copyWithoutAll: uncheckedMessages) ].
		
	^failedSpecs first validate: uncheckedMessages