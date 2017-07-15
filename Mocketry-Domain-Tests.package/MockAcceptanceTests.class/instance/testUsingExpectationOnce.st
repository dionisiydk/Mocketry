tests
testUsingExpectationOnce

	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; useOnce.
		
	mock someMessage should be: #result.
	mock someMessage should be: #default.