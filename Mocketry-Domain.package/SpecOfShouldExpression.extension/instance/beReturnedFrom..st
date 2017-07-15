*Mocketry-Domain
beReturnedFrom: aBlockWithMessageSpec

	| interactionSpec expectedSender senderSpec |
	interactionSpec := SpecOfObjectsInteraction new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: aBlockWithMessageSpec.
		
	expectedSender := interactionSpec expectedMessages last.
	senderSpec := SpecOfExpectedObjectSender for: receiver returnedFrom: expectedSender.
	senderSpec denial: withNegation.
	
	MockCurrentBehaviour validateOccurredMessagesBy: senderSpec