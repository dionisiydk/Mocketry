tests
testGettingValueFromLastCall

	| arg |
	
	arg := self prepareCapture.
	
	arg values: #(1 2).
	
	arg fromLastCall should be: 2