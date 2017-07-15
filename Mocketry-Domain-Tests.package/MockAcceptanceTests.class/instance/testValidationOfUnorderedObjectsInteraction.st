tests
testValidationOfUnorderedObjectsInteraction

	mock someMessage.
	mock someMessage2.
	
	[mock someMessage2] should beDone.	
	[mock someMessage2. mock someMessage] should beDone.
	
	[[mock someMessage. mock unhappenedMessage] should beDone] should raise: SpecOfFailed.