tests
testAllowMessageSendsCountWhichGreaterThanMinCount
		
	usage minCount: 3.
	
	usage should be allowMessageSends: 3.
	usage should not be allowMessageSends: 2