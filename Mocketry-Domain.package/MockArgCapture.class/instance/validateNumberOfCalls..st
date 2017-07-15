validation
validateNumberOfCalls: callsNumber
	| expectedMessageSpec |
	messageSpec ifNil: [ self error: 'Capture is not initialized with messageSpec!' ].
	
	expectedMessageSpec := SpecOfExpectedMessage new.
	expectedMessageSpec messageSend: messageSpec.
	expectedMessageSpec usage minCount: callsNumber.
		
	MockCurrentBehaviour validateOccurredMessagesBy: expectedMessageSpec.
	
	values ifEmpty: [ self error: 'No argument was captured!' ].
	values size < callsNumber ifTrue: [ 
		self error: 'Arguments was captured ', values size asString
							, ' times but should be ', callsNumber ]			