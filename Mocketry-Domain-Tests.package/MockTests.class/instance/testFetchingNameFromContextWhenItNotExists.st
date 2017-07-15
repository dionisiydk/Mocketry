tests
testFetchingNameFromContextWhenItNotExists
	
	| actual |
	actual := Mock new mockName.
		
	actual should be isAllDigits