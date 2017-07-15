tests
testAllowMessageSendsCountWhichLesserThanMaxCount
		
	usage maxCount: 3.
	
	usage should be allowMessageSends: 3.
	usage should not be allowMessageSends: 4