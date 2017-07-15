tests
testCleaningMocksAfterTestWithHaltAborted

	| suite result |
	suite := TestSuite new.
	suite addTest: self createTestCaseWithHaltToCheckMocksCleaning.	
		
	DefaultExecutionEnvironment beActiveDuring: [ 
	[suite run] on: Halt do: [:halt | 
		DefaultExecutionEnvironment beActiveDuring: [
			result := [suite run] on: Halt do: [:halt2 | halt2 resume].
			result should be hasPassed]]].
	