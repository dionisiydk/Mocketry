instance creation
from: aMessageSend 
	^self new
		spec: (SpecOfExpectedMessage from: aMessageSend)