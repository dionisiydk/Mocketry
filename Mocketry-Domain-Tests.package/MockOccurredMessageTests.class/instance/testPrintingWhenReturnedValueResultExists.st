tests
testPrintingWhenReturnedValueResultExists

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	message result: (MockOccurredValueReturn value: #result).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2 returned #result'