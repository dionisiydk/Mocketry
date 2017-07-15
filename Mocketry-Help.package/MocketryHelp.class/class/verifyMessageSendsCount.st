pages
verifyMessageSendsCount
	^ HelpTopic 
		title: 'Verify message sends count'
		contents:
'Mocketry allows to verify how many times object received particular message:

	mock := Mock new.
	
	mock someMessage.
	mock should receive someMessage once.
	
	mock someMessage.
	mock should receive someMessage twice.
	
	mock someMessage.
	mock should receive someMessage exactly: 3.
	mock should receive someMessage atLeast: 2.
	mock should receive someMessage atMost: 3.
	mock should receive someMessage atLeast: 1 atMost: 5.

Same works to verify that set of objects received particular message expected number of times:

	mock := Mock new.
	mock2 := Mock new.
		
	mock someMessage; someMessage.
	mock2 someMessage.
	
	Any should receive someMessage twice. "will fail because mock2 received #someMessage only once"
	
	mock2 someMessage.
	Any should receive someMessage twice. "will not fail because both mocks received #someMessage twice"
'