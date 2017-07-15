tests
testApplyingWhereExpression

	| arg |
	
	arg := self prepareCapture.
	
	arg values: {2@3}.
	
	arg where x should be: 2