accessing
arguments
	^(specs last: (specs size - 2)) collect: [ :each | each requiredValue ] 