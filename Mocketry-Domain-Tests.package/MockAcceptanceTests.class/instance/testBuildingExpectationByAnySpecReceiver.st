tests
testBuildingExpectationByAnySpecReceiver

	| mock2 |
	Any stub someMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	
	mock2 := Mock new.
	mock2 someMessage should be: #result.