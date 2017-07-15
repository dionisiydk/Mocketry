tests
testAllowMessageSendsCountWithNegatedLogicWhenMinCountIsZeroButMaxCountSpecified
		
	usage minCount: 0.
	usage maxCount: 3.
	
	usage should not be allowMessageSends: 1 withNegatedLogic: true.
	usage should be allowMessageSends: 4 withNegatedLogic: true