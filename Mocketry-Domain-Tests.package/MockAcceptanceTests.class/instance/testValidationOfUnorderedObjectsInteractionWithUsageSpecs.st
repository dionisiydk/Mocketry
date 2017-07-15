tests
testValidationOfUnorderedObjectsInteractionWithUsageSpecs
	
	mock someMessage.
	mock someMessage.
	mock someMessage2.
	
	[mock someMessage2. mock someMessage] should beDone.
	[mock someMessage2. mock someMessage twice] should beDone.
	
	[[mock someMessage2. mock someMessage once] should beDone] should raise: SpecOfFailed.