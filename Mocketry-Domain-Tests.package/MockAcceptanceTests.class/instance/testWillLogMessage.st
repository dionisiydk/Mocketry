tests
testWillLogMessage

	(mock stub someMessageWith: Any) willLogMessage; willReturn: #result.
	
	mock someMessageWith: #arg1.
	(mock someMessageWith: #arg2) should be: #result