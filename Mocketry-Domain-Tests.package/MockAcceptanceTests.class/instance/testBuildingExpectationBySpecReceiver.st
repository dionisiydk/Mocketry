tests
testBuildingExpectationBySpecReceiver

	| mock2 |
	mock2 := Mock new.
	
	(SpecOfOrDisjunction of: mock and: mock2) stub someMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	mock2 someMessage should be: #result.