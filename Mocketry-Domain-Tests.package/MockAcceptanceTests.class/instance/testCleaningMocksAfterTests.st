tests
testCleaningMocksAfterTests

	| suite result |
	suite := TestSuite new.
	suite addTest: self createTestCaseToCheckMocksCleaning.	

	DefaultExecutionEnvironment beActiveDuring: [result := suite run].
	result should be hasPassed.
	
	DefaultExecutionEnvironment beActiveDuring: [result := suite run].
	result should be hasPassed.