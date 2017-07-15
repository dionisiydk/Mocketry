tests
testBuildingExpectationsByBlock

	| mock2 |
	mock2 := Mock new.
	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2] should expect.
	
 	mock someMessage should be: #result.	
	mock2 someMessage2 should be: #result2.