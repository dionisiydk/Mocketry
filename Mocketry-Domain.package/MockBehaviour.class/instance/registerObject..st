controlling
registerObject: anObject

	registeredObjects add: anObject.
	(anObject ghostClass inheritsFrom: Class) ifTrue: [ globalStubs add: anObject ]