printing
printRestrictions

	| result |
	minCount = maxCount ifTrue: [ ^minCount asString, ' times' ].
	
	(self isMinCountSpecified not and: [ self isMaxCountSpecified not ])
		ifTrue: [ ^'at least ', minCount asString , ' times' ].
		
	result := ''.
	self isMinCountSpecified ifTrue: [ 
		result :=  result , 'at least ', minCount asString , ' times'].
	self isMaxCountSpecified ifTrue: [ 
		result ifNotEmpty: [ result := result , ' ' ].
		result := result , 'at most ', maxCount asString, ' times' ].
	^result