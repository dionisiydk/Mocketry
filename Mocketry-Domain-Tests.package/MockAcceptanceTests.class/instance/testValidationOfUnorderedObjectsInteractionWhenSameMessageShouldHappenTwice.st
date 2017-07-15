tests
testValidationOfUnorderedObjectsInteractionWhenSameMessageShouldHappenTwice

	mock someMessage.
	mock someMessage2.
	mock someMessage.
		
	[mock someMessage twice. mock someMessage2] should beDone