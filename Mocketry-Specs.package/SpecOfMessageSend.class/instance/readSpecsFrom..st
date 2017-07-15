accessing
readSpecsFrom: aMessageSend

	specs := OrderedCollection new: 2 + aMessageSend numArgs.
	specs add: (SpecOfMessageReceiver requiredValue: aMessageSend receiver).
	specs add: (	SpecOfMessageSelector requiredValue: aMessageSend selector).
	
	aMessageSend arguments withIndexDo: [:each :i |
		specs add: (each asSpecOfArg: i of: self) ]