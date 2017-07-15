operations
replayMessageSend: anOccurredMessage
	| expected |
	
	occurredMessages add: anOccurredMessage.
	
	expected := expectedMessages 
		detect: [ :each | each isAbout: anOccurredMessage ]
		ifNone: [^anOccurredMessage setUpUnexpectedResult].
	
	^anOccurredMessage extractResultFrom: [expected executeAs: anOccurredMessage].