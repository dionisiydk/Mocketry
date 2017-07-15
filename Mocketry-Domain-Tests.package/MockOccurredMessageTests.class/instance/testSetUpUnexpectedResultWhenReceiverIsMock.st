tests
testSetUpUnexpectedResultWhenReceiverIsMock

	| message mock returnedMock |
	mock := Mock new.
	message := MockOccurredMessage receiver: mock selector: #selector.
	
	returnedMock := message setUpUnexpectedResult.
	
	message where result should beInstanceOf: MockOccurredDefaultReturn.
	message where result returnedMock should be: returnedMock.
	returnedMock should beInstanceOf: MockForMessageReturn