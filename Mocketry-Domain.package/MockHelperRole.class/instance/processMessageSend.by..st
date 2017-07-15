processing
processMessageSend: anOccurredMessage by: aMockBehaviour

	anOccurredMessage receiver: object.
	anOccurredMessage selector == #anyMessage ifTrue: [ anOccurredMessage selector: Any ].
	
	^self processTransformedMessageSend: anOccurredMessage by: aMockBehaviour