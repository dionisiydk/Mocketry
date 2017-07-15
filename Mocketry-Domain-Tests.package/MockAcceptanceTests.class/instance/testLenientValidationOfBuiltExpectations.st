tests
testLenientValidationOfBuiltExpectations

	| mock2 |
	mock2 := Mock new.
	mock stub notParticipatingMessage willReturn: 10.
	
	[ mock someMessage should be: #result.	
	mock2 someMessage2 should be: #result2 ]
		should lenient satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]