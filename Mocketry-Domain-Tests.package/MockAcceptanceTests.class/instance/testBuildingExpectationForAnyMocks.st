tests
testBuildingExpectationForAnyMocks

	| mock2 |
	Mock stub someMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	
	mock2 := Mock new.
	mock2 someMessage should be: #result