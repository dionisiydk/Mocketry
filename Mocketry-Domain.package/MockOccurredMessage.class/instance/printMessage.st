printing
printMessage

	^String streamContents: [ :s | self printMessageOn: s ]