validation
basicMatches: occurredMessages

	| uncheckedMessages result |
	
	uncheckedMessages := OrderedCollection withAll: occurredMessages.

	expectedMessages do: [ :eachSpec |	
		result := eachSpec validate: uncheckedMessages.
		
		result isFailure ifTrue: [ ^false].
		uncheckedMessages := uncheckedMessages copyAfter: result requiredOccurredMessages last.
	].
	
	^true