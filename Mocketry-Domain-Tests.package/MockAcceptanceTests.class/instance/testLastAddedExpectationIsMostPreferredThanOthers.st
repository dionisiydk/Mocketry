tests
testLastAddedExpectationIsMostPreferredThanOthers

	(mock stub someMessageWith: Any) willReturn: #defaultResult.
	(mock stub someMessageWith: 3) willReturn: #resultFor3.
		
	(mock someMessageWith: 3) should be: #resultFor3.
	(mock someMessageWith: 2) should be: #defaultResult.