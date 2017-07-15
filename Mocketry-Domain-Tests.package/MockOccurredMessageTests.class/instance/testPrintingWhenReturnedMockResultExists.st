tests
testPrintingWhenReturnedMockResultExists

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	message result: (MockOccurredValueReturn value: (Mock named: 'testMock')).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2 returned a Mock(testMock)'