tests
testWasReturnValueWhichSatisfiedSpec

	| message error |
	message := MockOccurredMessage new.
	message result: 1 asOccurredMessageResult.
	
	message should be hasReturnedValueLike: 1.
	message should be hasReturnedValueLike: (Kind of: Number).
	
	error := Error new.
	message result: (MockOccurredExceptionSignal exception: error).
	message should not be hasReturnedValueLike: error.