instance creation
of: occurredMessages spec: anOrderedInteractionSpec wrongMessage: anExpectedMessageSpec

	^(self spec: anOrderedInteractionSpec for: occurredMessages)
		wrongMessage: anExpectedMessageSpec 