extra validation
which

	| result lastMessage |
	result := self execute.
	lastMessage := result occurredMessages last.
	
	^SpecOfObjectPropertyBuilder new 
		property: (MockOccurredResultProperty message: lastMessage)