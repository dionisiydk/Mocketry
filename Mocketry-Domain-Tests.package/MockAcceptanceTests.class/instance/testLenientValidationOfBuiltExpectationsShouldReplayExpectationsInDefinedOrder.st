tests
testLenientValidationOfBuiltExpectationsShouldReplayExpectationsInDefinedOrder

	mock stub someMessage willReturn: #result0.
	
	[ mock someMessage should be: #result1.
	mock someMessage should be: #result2. ]
		should lenient satisfy: 	
	[mock someMessage useOnce; willReturn: #result1.
	mock someMessage useOnce; willReturn: #result2].

	mock someMessage should be: #result0