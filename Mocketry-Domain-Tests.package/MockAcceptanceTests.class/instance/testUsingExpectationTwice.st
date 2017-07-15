tests
testUsingExpectationTwice

	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; useTwice.
		
	mock someMessage should be: #result.
	mock someMessage should be: #result.

	mock someMessage should be: #default.