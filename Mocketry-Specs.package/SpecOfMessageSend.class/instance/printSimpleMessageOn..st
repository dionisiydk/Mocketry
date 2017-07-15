printing
printSimpleMessageOn: aStream

	| selector args |
	selector := self selector asSimpleValue.
	args := self arguments.

	args isEmpty ifTrue: [^ aStream << selector].
	args with: selector keywords do: [:arg :word |
		aStream << word; space.
		arg isSimpleValue 
			ifTrue: [aStream << arg asSimpleValue stringForSpecTitle] 
			ifFalse: [aStream << $( << arg stringForSpecTitle << $)].
		aStream space.
	].
	aStream skip: -1