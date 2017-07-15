tests
testCurrentBehaviourShouldBeChangedWhenEnvironmentChanged

	| behaviour2 currentEnv newEnv |
	currentEnv := TestExecutionEnvironment new.
	currentEnv testCase: self.

	currentEnv beActiveDuring: [ behaviour := MockCurrentBehaviour value].
	behaviour where ownerEnvironment should be: currentEnv.

	newEnv := TestExecutionEnvironment new.
	newEnv testCase: self.
	
	newEnv beActiveDuring: [ 
		"here env change should be detected"
		behaviour2 := MockCurrentBehaviour value].
	behaviour2 where ownerEnvironment should be: newEnv.
	behaviour2 should not be: behaviour