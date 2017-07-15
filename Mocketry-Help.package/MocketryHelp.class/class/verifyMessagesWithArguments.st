pages
verifyMessagesWithArguments
	^ HelpTopic 
		title: 'Verify messages with arguments'
		contents:
'In place of message arguments you can use expected objects itself. Or you can put specifications for expected arguments:

	mock := Mock new.
	
	(mock messageWith: 10) should be: #ten.
	(mock messageWith: ''test'' should be: #anyString.
	
	mock should receive messageWith: 10.
	mock should receive messageWith: (Instance of: SmallInteger).
	mock should receive messageWith: ''test''.
	mock should receive messageWith: (Kind of: String).
	mock should receive messageWith: [:arg | arg isNumber].
'