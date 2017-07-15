tests
testAllowMessageSendsCountWithNegatedLogic
		
	usage minCount: 3.
	
	usage should not be allowMessageSends: 3 withNegatedLogic: true.
	usage should be allowMessageSends: 2 withNegatedLogic: true