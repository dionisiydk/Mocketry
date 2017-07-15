validation
validate: occurredMessages

	| matched wrongMessage |
	matched := occurredMessages select: [ :each | 
		messageSend basicMatches: each  ].
	
	(self allowSendsCount: matched size) ifTrue: [ ^ self createValidationSuccessFor: matched].
	
	wrongMessage := self detectFailureIn: (occurredMessages copyWithoutAll: matched).
	^SpecOfExpectedMessageValidationFailure 
		spec: self 
		for: occurredMessages
		occuredMessages: matched 
		mostSimilarMessage: wrongMessage