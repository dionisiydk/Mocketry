processing
processMessageSend: anOccurredMessage by: aMockBehaviour
	| expectation |
	expectation := MockExpectedMessage from: anOccurredMessage.
	expectation restrictUsage.
	
	aMockBehaviour addExpectation: expectation asPartOfGroup: expectations.
	expectations add: expectation.
	
	^expectation