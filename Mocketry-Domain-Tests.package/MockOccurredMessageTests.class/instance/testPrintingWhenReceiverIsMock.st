tests
testPrintingWhenReceiverIsMock

	| message |
	message := MockOccurredMessage receiver: (Mock named: 'testMock') selector: #messageWith:and: arguments: #(arg1 arg2).
	
	message printString should equal: 'a Mock(testMock) messageWith: #arg1 and: #arg2'