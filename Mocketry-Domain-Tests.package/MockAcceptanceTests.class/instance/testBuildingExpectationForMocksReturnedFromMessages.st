tests
testBuildingExpectationForMocksReturnedFromMessages

	MockForMessageReturn stub extraMessage willReturn: #result.
	
 	mock someMessage extraMessage should be: #result.
	mock someMessage2 extraMessage should be: #result