instance creation
spec: aSpecOfExpectedMessage for: actualMessages occuredMessages: occurredMessages mostSimilarMessage: wrongMessageFailure

	^(self spec: aSpecOfExpectedMessage for: actualMessages )
		occuredMessages: occurredMessages;
		mostSimilarMessage: wrongMessageFailure