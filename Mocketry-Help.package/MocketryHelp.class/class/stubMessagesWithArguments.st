pages
stubMessagesWithArguments
	^ HelpTopic 
		title: 'Stub messages with arguments'
		contents:
'In place of message arguments you can use expected objects itself. Or you can put specifications for expected arguments:

	mock stub messageWith: arg1 and: arg2
	mock stub messageWith: Any and: arg2
	mock stub messageWith: [:arg | true]
	mock stub messageWith: (Kind of: String) and: arg2
	mock stub messageWith: (Instance of: Float) & (Satisfying for: [:arg | arg > 10]).
	
Last defined expectation has more priority than previous one. It allows you to define default expectations in setUp method and override it in particular tests. Following example shows it:
	
	mock := Mock new.
	(mock stub messageWith: (Instance of: SmallInteger)) willReturn: #anyInt.
	(mock stub messageWith: (Kind of: String)) willReturn: #anyString.
	(mock stub messageWith: 10) willReturn: #ten.

	(mock messageWith: 10) should be: #ten.
	(mock messageWith: 20) should be: #anyInt.
	(mock messageWith: ''test'' should be: #anyString'