tests
testLenientValidationOfBuiltExpectationsShouldSetUpUsageOnceSpecByDefault

	mock stub someMessage willReturn: #result0.
	
	[ mock someMessage should be: #result1.
	mock someMessage should be: #result2. ]
		should lenient satisfy: 	
	[mock someMessage willReturn: #result1.
	mock someMessage willReturn: #result2].

	mock someMessage should be: #result0