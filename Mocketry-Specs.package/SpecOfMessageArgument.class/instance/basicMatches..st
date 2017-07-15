testing
basicMatches: aMessageSend

	| arg |
	argumentNumber > aMessageSend numArgs ifTrue: [^false].
	
	arg := aMessageSend arguments at: argumentNumber.
	^requiredValue basicMatches: arg