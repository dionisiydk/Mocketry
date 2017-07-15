tests
testStrictValidationOfBuiltExpectationsWhenMoreMessagesWereOccurred

	| mock2 |
	mock2 := Mock new.
	
	[	mock someMessage should be: #result. 
	mock2 someMessage2 should be: #result2.
	mock someMessage3 ]
		should strictly satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]