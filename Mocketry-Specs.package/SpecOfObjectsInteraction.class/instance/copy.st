accessing
copy
	| copy |
	copy := super copy.
	copy expectedMessages: (expectedMessages collect: [ :each | each copy]).
	^copy