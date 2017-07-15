tests
testAllowMessageSendsCountWithNegatedLogicWhenMinCountIsZero
		
	usage minCount: 0.
	
	usage should not be allowMessageSends: 1 withNegatedLogic: true.
	usage should be allowMessageSends: 0 withNegatedLogic: true