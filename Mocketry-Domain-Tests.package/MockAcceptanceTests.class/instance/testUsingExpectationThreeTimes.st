tests
testUsingExpectationThreeTimes

	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; use: 3.
		
	mock someMessage should be: #result.
	mock someMessage should be: #result.
	mock someMessage should be: #result.
	
	mock someMessage should be: #default.