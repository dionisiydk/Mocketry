tests
testExpectationWithConditionVerificationBySpec

	| flag |
	mock stub someMessage when: [ flag ] is: (Equal to: true).
	
	[mock someMessage] should raise: SpecOfFailed.
	
	flag := true.	
	mock someMessage