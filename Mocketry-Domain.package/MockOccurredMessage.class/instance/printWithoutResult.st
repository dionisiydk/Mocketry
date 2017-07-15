printing
printWithoutResult
	
	^String streamContents: [ :s | self printWithoutResultOn: s ]