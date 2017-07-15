message interception
send: aMessage to: aMockObject
	| occurredMessage |
	occurredMessage := MockOccurredMessage 
				receiver: aMockObject 
				selector: aMessage selector
				arguments: aMessage arguments.
				
	^mockRole processMessageSend: occurredMessage by: self