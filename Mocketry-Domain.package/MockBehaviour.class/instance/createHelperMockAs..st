operations
createHelperMockAs: aMockRole

	| helperBehaviour mock |
	helperBehaviour := self copy.
	helperBehaviour mockRole: aMockRole.
	
	mock := MockHelper named: aMockRole printString.
	mock ghostBehaviour: helperBehaviour.
	^mock