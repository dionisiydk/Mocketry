tests
testPrintingWhenDefaultReturnedMockWasConvertedToBoolean

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	message result: (MockOccurredDefaultReturn with: true).
	
	message printString should be beginsWith: '#receiver selector returned true'