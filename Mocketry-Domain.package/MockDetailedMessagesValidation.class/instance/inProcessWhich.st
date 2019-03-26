extra validation
inProcessWhich

	| result lastMessage |
	result := self execute.
	lastMessage := result occurredMessages last.
	
	^SpecOfObjectPropertyBuilder new 
		property: (MockOccurredMessageProcessProperty of: lastMessage)