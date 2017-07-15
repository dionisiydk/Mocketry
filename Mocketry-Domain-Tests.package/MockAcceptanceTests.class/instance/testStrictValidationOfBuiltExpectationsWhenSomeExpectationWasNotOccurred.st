tests
testStrictValidationOfBuiltExpectationsWhenSomeExpectationWasNotOccurred

	| mock2 |
	mock2 := Mock new.
	
	[
		[ mock someMessage should be: #result]
			should strictly satisfy: 	
		[mock someMessage willReturn: #result.
		mock2 someMessage2 willReturn: #result2]
	] should raise: SpecOfFailed