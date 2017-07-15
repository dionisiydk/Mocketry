validation
validateSingleValue 

	self validateNumberOfCalls: 1.
	
	values asSet size > 1 ifTrue: [ self error: 'Multiple args was captured! Choose concrete by #fromCall:' ].