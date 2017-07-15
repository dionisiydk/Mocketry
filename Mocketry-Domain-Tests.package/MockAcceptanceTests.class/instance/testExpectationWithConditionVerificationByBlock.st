tests
testExpectationWithConditionVerificationByBlock

	| flag |
	mock stub someMessage when: [ flag ] satisfy: [ :v | flag = true ].
	
	[mock someMessage] should raise: SpecOfFailed.
	
	flag := true.	
	mock someMessage