instance creation
of: occurredMessages spec: anOrderedInteractionSpec validMessages: validExpectedMessages wrongMessage: anExpectedMessageSpec

	^(self spec: anOrderedInteractionSpec for: occurredMessages)
		wrongMessage: anExpectedMessageSpec;
		validMessages: validExpectedMessages