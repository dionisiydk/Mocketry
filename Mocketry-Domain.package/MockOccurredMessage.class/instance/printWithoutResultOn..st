printing
printWithoutResultOn: aStream
	
	aStream << receiver stringForSpecTitle; << ' '.
	self printMessageOn: aStream