tests
testAsyncMessageExpectation

	| actual |
	mock stub someMessage shouldBeSentInAnotherProcess; willReturn: #result.
	
	[mock someMessage] should raise: SpecOfFailed.
	
	[actual := mock someMessage] fork.
	50 milliSeconds wait.
	
	actual should be: #result