tests
testCurrentBehaviourShouldBeChangedWhenTestChangedDuringSingleTestCaseRun

	| behaviour2 currentEnv |
	currentEnv := TestExecutionEnvironment new.
	currentEnv testCase: (self class selector: #test1) .

	currentEnv beActiveDuring: [ behaviour := MockCurrentBehaviour value].
	behaviour where ownerEnvironment should be: currentEnv.

	currentEnv testCase setTestSelector: #newTest.
	
	currentEnv beActiveDuring: [ 
		"here env change should be detected"
		behaviour2 := MockCurrentBehaviour value].
	behaviour2 where ownerEnvironment should be: currentEnv.
	behaviour2 should not be: behaviour