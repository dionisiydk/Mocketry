*Mocketry-Domain
beDoneInOrder

	| interactionSpec |
	interactionSpec := SpecOfOrderedObjectsInteraction new.
	
	MockCurrentBehaviour useMockRole: (MockInteractionSpecBuilder for: interactionSpec) while: receiver.
	
	MockCurrentBehaviour validateOccurredMessagesBy: interactionSpec