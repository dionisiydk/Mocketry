evaluating
executeFor: anOccurredMessage

	currentValueIndex ifNil: [ currentValueIndex := 0 ].
	
	^values at: (currentValueIndex := currentValueIndex + 1)