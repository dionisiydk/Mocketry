tests
testExpectationWithConditionVerificationAndFollowingReturn

	| flag |
	mock stub someMessage 
		willReturn: #result;
		when: [ flag ] is: (Equal to: true).
	
	[mock someMessage] should raise: SpecOfFailed.
	
	flag := true.	
	mock someMessage should be: #result