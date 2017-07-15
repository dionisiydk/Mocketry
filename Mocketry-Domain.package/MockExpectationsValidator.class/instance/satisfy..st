validation
satisfy: blockWithExpectations

	| teacher |
	teacher := MockValidatedExpectationsTeacher new.
	MockCurrentBehaviour useMockRole: teacher while: blockWithExpectations.
	
	verifiedBlock value.
	interactionSpec expectedMessages: teacher convertExpectationsToSpecs.
	MockCurrentBehaviour validateOccurredMessagesBy: interactionSpec