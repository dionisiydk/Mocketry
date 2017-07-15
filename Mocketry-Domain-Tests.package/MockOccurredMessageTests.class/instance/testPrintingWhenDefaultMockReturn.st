tests
testPrintingWhenDefaultMockReturn

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	message result: (MockForMessageReturn from: message) asOccurredMessageResult.
	
	message printString should be beginsWith: '#receiver selector returned default mock'