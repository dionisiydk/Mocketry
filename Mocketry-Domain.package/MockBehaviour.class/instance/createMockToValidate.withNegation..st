operations
createMockToValidate: anObject withNegation: aBoolean
	
	^self createHelperMockAs: (MockValidator for: anObject withNegation: aBoolean)