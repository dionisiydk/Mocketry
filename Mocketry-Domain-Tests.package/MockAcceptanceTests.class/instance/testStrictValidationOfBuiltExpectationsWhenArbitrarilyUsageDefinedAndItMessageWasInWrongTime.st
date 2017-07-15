tests
testStrictValidationOfBuiltExpectationsWhenArbitrarilyUsageDefinedAndItMessageWasInWrongTime

	[mock someMessage2 should be: #result2.
	mock someMessage should be: #result. ]
			should strictly satisfy: 	
	[mock someMessage willReturn: #result.
	mock someMessage2 willReturn: #result2; useArbitrarily]