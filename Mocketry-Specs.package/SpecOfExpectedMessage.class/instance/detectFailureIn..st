validation
detectFailureIn: messages
	| withSimilarReceiver withSimilarSelector |
	withSimilarReceiver := messages select: [ :each | messageSend receiver matches: each receiver].
	withSimilarReceiver ifEmpty: [ ^nil ].
	
	withSimilarSelector := withSimilarReceiver 
		detect: [:each | messageSend selector matches: each selector]
		ifNone: [^messageSend validate: withSimilarReceiver first].
		
	^messageSend validate: withSimilarSelector 