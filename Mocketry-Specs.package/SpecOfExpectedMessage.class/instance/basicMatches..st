testing
basicMatches: occurredMessages

	| count |
	count := occurredMessages count: [ :each | 
		messageSend matches: each  ].
	
	^usage allowMessageSends: count