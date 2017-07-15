printing
printArgumentsArrayOn: aStream

	| args |
	aStream << ${.

	args := self arguments.
	
	args do: [:each |
		each isSimpleValue 
			ifTrue: [ aStream << each asSimpleValue stringForSpecTitle]
			ifFalse: [ aStream << each title ].
		each == args last ifFalse: [ aStream << $.]].	

	aStream << $}.