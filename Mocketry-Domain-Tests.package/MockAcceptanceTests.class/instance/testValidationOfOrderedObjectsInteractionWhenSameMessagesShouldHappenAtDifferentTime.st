tests
testValidationOfOrderedObjectsInteractionWhenSameMessagesShouldHappenAtDifferentTime

	mock someMessage.
	mock someMessage2.
	mock someMessage.
		
	[mock someMessage. mock someMessage2. mock someMessage] should beDoneInOrder.
	[mock someMessage. mock someMessage] should beDoneInOrder.

	[[mock someMessage2. mock someMessage. mock someMessage] should beDoneInOrder] should raise: SpecOfFailed