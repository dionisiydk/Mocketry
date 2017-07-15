tests
methodForTestWithHaltWhichCheckThatMockCleaningWorks

	mock := Mock new.
	
	mock someMessage should not be: #firstTestResult.

	Any stub someMessage willReturn: #firstTestResult.
	
	self halt.
	
	mock someMessage should be: #firstTestResult