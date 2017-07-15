printing
description

	| desc |
	desc := subject receiver stringForSpecValidation, ' should receive ', subject printMessage.
	spec denial 
		ifTrue: [ desc := desc , ' in original process' ]
		ifFalse: [ desc := desc , ' in another process' ].
	^desc