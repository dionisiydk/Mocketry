tests
testRunningBlockWithMocks
	
	[:mockA :mockB | 
		mockA mockName should equal: 'mockA'.
		mockB mockName should equal: 'mockB'.
		
		mockA someMessage.
		
		mockA should receive someMessage
	] runWithMocks.

	