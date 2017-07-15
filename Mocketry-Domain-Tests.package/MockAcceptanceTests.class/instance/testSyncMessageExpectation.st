tests
testSyncMessageExpectation

	| raised |
	mock stub someMessage shouldBeSentInThisProcess; willReturn: #result.

	[mock someMessage] should not raise: SpecOfFailed.
	
	[ [mock someMessage] should raise: SpecOfFailed.	raised := true ] fork.
	50 milliSeconds wait.
	
	raised should be: true