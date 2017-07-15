*Mocketry-Domain
stubDoesNotExpect: anOccurredMessage
	
	^GHCurrentMetaLevelDepth decreaseFor: [ 	  
		GHVictimMetaMessages executeOriginalMethodOf: ghost for: anOccurredMessage
	] 