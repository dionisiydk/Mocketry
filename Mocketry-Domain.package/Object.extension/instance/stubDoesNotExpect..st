*Mocketry-Domain
stubDoesNotExpect: anOccurredMessage
	
	^GHMetaMessages 
		withReceiver: self 
		perform: anOccurredMessage selector  
		withArguments: anOccurredMessage arguments
		 