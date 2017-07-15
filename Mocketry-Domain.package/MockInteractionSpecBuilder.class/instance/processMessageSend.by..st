processing
processMessageSend: anOccurredMessage by: aMockBehaviour
	
	| messageSpec |
	messageSpec := SpecOfExpectedMessage from: anOccurredMessage.
	
	spec addExpectedMessage: messageSpec.
	
	^MockDetailedExpectationBuilding on: messageSpec