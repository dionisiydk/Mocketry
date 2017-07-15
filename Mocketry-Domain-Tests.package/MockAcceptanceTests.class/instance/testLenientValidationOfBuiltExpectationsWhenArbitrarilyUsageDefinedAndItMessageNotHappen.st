tests
testLenientValidationOfBuiltExpectationsWhenArbitrarilyUsageDefinedAndItMessageNotHappen

	[mock someMessage should be: #result. ]
			should lenient satisfy: 	
	[mock someMessage willReturn: #result.
	mock someMessage2 willReturn: #result2; useArbitrarily]