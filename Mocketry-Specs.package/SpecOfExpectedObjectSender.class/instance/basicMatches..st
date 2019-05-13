testing
basicMatches: occurredMessages

	| actualSenders |
	actualSenders := occurredMessages select: [:each | each hasReturnedValueLike: object].
	
	^requiredSender basicMatches: actualSenders