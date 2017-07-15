processing
processTransformedMessageSend: anOccurredMessage by: aMockBehaviour

	| spec |	
	spec := SpecOfExpectedMessage from: anOccurredMessage.
	spec denial: withNegation.
	
	aMockBehaviour validateOccurredMessagesBy: spec.
	
	^MockDetailedMessagesValidation on: spec