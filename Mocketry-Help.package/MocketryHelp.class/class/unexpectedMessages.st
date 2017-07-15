pages
unexpectedMessages
	^ HelpTopic 
		title: 'Unexpected messages. Automocks'
		contents: 
'Mock returns another special mock for unexpected messages (when no expectation is defined for received message):

	mock := Mock new.
	
	automock := mock someMessage.
	
	automock should beInstanceOf: MockForMessageReturn.
	
And any message to this mock will produce another automocks. 
It means that your tests will not fail if you will not define expectations for your mocks. 
It allows put only required detailes inside your tests which really make sense for tested aspect of functionality.

Also to improve this idea automock try to play role of false in boolean expressions. 

	mock := Mock new.
	returnedMock := mock someMessage.
	
	result := returnedMock ifFalse: [ #falseBranch ] ifTrue: [ #trueBranch ].
	
	result should be: #falseBranch.
	returnedMock should be: false

And play zero in arithmetic

	mock := Mock new.
	returnedMock := mock someMessage.
	
	result := 1 + returnedMock.
	result should equal: 1.
	returnedMock should equal: 0
'