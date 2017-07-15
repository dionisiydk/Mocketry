testing
basicMatches: occurredMessages

	| actualSender |
	actualSender := occurredMessages 
		detect: [:each | each hasReturnedValueLike: object]
		ifNone: [^false].
	
	^requiredSender basicMatches: { actualSender }