pages
verifyMessageSendResult
	^ HelpTopic 
		title: 'Verify message send result'
		contents:
'There are two ways how to verify result of occurred message:

First you can continue "should receive" expression with "which should" clause to validate actual returned value:

	rect := 0@0 corner: 2@3.
	rect stub.
	
	rect area.
	
	rect should receive area which should equal: 6.
	rect should receive width which should beKindOf: Number 
	
And you can validate sender message of any object:

	mock := Mock new.
	
	result := mock someMessage.
	
	result should beReturnedFrom: [ mock someMessage ].
'