testing
basicMatches: occurredMessages

	^expectedMessages allSatisfy: [ :each | 
		each matches: occurredMessages ]