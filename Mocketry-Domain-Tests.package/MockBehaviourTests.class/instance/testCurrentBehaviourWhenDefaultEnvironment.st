tests
testCurrentBehaviourWhenDefaultEnvironment

	| behaviour2 defaultEnv |
	[DefaultExecutionEnvironment beActive.	
	behaviour := MockCurrentBehaviour value.
	behaviour should not be: nil.
	behaviour where ownerEnvironment should be: DefaultExecutionEnvironment instance.
	
	behaviour2 := MockCurrentBehaviour value.
	behaviour2 should not be: nil.
	behaviour2 where ownerEnvironment should be: DefaultExecutionEnvironment instance.

	behaviour2 should be: behaviour] fork.
	30 milliSeconds wait.
	