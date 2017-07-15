printing
printOn: aStream

	arguments ifNil: [ 
		^super printOn: aStream].
	
	self printWithoutResultOn: aStream.

	result ifNotNil: [ aStream << ' '; print: result ]