capturing arguments
captureValue: anObject

	anObject isAllowAutoStub ifTrue: [ anObject stub ].
	
	values add: anObject