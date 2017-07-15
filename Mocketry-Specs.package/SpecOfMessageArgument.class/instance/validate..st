validation
validate: aMessageSend

	| result |
	argumentNumber > aMessageSend numArgs ifTrue: [ 
		^SpecOfAbsentMessageArgument spec: self for: aMessageSend ].
	
	result := requiredValue validate: (aMessageSend arguments at: argumentNumber).
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongMessageArgument of: aMessageSend spec: self