instance creation
for: aString returnedFrom: aSpecOfExpectedMessage 
	^self new 
		object: aString;
		requiredSender: aSpecOfExpectedMessage 