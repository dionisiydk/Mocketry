tests
testPrintingWhenRaisedExceptionResultExists

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	message result: (MockOccurredExceptionSignal exception: (Error new messageText: 'test error')).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2 raised Error: test error'