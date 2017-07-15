processing
processTransformedMessageSend: anOccurredMessage by: aMockBehaviour
	
	| expectation |
	expectation := MockExpectedMessage from: anOccurredMessage.

	aMockBehaviour addExpectation: expectation.
	
	^expectation