tests
testCleaningMocksAfterTestWithHaltResumed

	| suite result |
	suite := TestSuite new.
	suite addTest: self createTestCaseWithHaltToCheckMocksCleaning.	

	DefaultExecutionEnvironment beActiveDuring: [
		result := [suite run] on: Halt do: [:halt | halt resume]].
	result should be hasPassed.
	
	DefaultExecutionEnvironment beActiveDuring: [
		result := [suite run] on: Halt do: [:halt | halt resume]].
	result should be hasPassed.