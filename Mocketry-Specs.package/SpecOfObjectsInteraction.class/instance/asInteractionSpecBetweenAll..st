converting
asInteractionSpecBetweenAll: expectedReceivers

	| result interactionSpec |
	result := self class new.
	
	expectedMessages do: [ :each | 

		interactionSpec := each asInteractionSpecBetweenAll: expectedReceivers.
		interactionSpec populateObjectsInteractionSpec: result		
	 ].

	^result