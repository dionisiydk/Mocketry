tests
testGettingValueFromGivenCall

	| arg |
	
	arg := self prepareCapture.
	
	arg values: #(1 2 3).
	
	(arg fromCall: 2) should be: 2