accessing
mockName

	^name ifNil: [ self setUpDefaultMockName. "it is to prevent recursion if tools start to debug next sentence and they will needed in mock name"
		self setUpNameFromTestContext. 
		name ]