tests
testValidationOfOrderedObjectsInteraction

	mock someMessage.
	mock someMessage2.
	mock someMessage3.
		
	[mock someMessage. mock someMessage3] should beDoneInOrder.

	[[mock someMessage2. mock someMessage] should beDoneInOrder] should raise: SpecOfFailed