tests
testPrinting

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2'