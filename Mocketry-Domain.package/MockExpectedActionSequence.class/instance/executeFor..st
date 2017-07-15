evaluating
executeFor: anOccurredMessage 

	actions ifEmpty: [ ^anOccurredMessage setUpUnexpectedResult  ].
		
	actions allButLastDo: [:eachPart | eachPart executeFor: anOccurredMessage].
	
	^actions last executeFor: anOccurredMessage