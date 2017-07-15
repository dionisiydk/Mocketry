tests
testBuildingExpectationForAnyMessageSend

	mock stub anyMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	mock someMessage2 should be: #result