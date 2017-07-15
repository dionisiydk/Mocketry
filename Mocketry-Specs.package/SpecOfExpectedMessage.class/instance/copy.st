accessing
copy

	| result |
	result := super copy.
	
	result 
		messageSend: messageSend copy;
		usage: usage copy.
	
	^result