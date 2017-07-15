tests
testValidationOfOrderedObjectsInteractionWhenSameMessageShouldHappenTwice

	mock someMessage.
	mock someMessage.
	mock someMessage2.
	mock someMessage3.
	mock someMessage2.
	
	[mock someMessage twice. mock someMessage3] should beDoneInOrder.	
	[[mock someMessage2 twice. mock someMessage3] should beDoneInOrder] should raise: SpecOfFailed