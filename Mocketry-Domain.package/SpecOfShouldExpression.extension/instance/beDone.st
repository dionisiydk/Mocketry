*Mocketry-Domain
beDone

	| interactionSpec |
	interactionSpec := SpecOfObjectsInteraction new.
	
	MockCurrentBehaviour useMockRole: (MockInteractionSpecBuilder for: interactionSpec) while: receiver.
	
	MockCurrentBehaviour validateOccurredMessagesBy: interactionSpec.
	
	^interactionSpec