tests
testChoosingPreferredExpectedMessageByArgs

	(mock stub someMessageWith: 2) willReturn: #resultFor2.
	(mock stub someMessageWith: 3) willReturn: #resultFor3.
		
	(mock someMessageWith: 3) should be: #resultFor3.
	(mock someMessageWith: 2) should be: #resultFor2.