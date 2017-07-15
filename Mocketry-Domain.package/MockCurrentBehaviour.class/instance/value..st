evaluating
value: anObject

	| currentBehaviour |
	currentBehaviour := Processor activeProcess psValueAt: index.
	currentBehaviour ifNotNil: [ currentBehaviour recoverGlobalStubs].
	
	super value: anObject