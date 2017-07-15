processing
processMessageSend: anOccurredMessage by: aMockBehaviour

	| expectation |
	expectation := MockExpectedMessage from: anOccurredMessage.

	aMockBehaviour addExpectation: expectation.
	
	^expectation