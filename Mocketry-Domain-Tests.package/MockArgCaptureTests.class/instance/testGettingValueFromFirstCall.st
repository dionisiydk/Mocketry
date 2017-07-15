tests
testGettingValueFromFirstCall

	| arg |
	
	arg := self prepareCapture.
	
	arg values: #(1 2).
	
	arg fromFirstCall should be: 1