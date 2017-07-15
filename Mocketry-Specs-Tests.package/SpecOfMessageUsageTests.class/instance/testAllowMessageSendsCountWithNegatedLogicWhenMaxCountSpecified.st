tests
testAllowMessageSendsCountWithNegatedLogicWhenMaxCountSpecified
		
	usage minCount: 3.
	usage maxCount: 5.

	usage should not be allowMessageSends: 3 withNegatedLogic: true.
	usage should be allowMessageSends: 2 withNegatedLogic: true.
	
	usage should not be allowMessageSends: 5 withNegatedLogic: true.
	usage should be allowMessageSends: 6 withNegatedLogic: true