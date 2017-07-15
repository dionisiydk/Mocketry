tests
methodForTestWhichCheckThatMockCleaningAfterEachTestIsWorking

	mock := Mock new.
	
	mock someMessage should not be: #firstTestResult.

	Any stub someMessage willReturn: #firstTestResult.

	mock someMessage should be: #firstTestResult