tests
testWillExecuteSeveralActionsOnSingleMessageSend

	| actual firstBlockDone secondBlockDone |
	mock stub someMessage will: [firstBlockDone := true]; will: [secondBlockDone := true]; willReturn: #result.
	
	actual := mock someMessage.
	
	actual should be: #result.
	firstBlockDone should be: true.
	secondBlockDone should be: true.