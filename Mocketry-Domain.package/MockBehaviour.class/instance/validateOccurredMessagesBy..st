operations
validateOccurredMessagesBy: aSpecOfOccurredMessages 
	
	| separateSpecs |
	separateSpecs := aSpecOfOccurredMessages asInteractionSpecBetweenAll: self registeredObjects.
	
	^(separateSpecs validate: occurredMessages) raise