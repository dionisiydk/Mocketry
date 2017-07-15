testing
allowMessageSends: messagesCount withNegatedLogic: denial

	(messagesCount = 0 & (minCount = 0) & denial) ifTrue: [ ^true ].
	
	^(messagesCount between: minCount and: maxCount) ~= denial