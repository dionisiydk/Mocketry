tests
testCurrentBehaviourShouldNotBeInheritedByForkedProcessFromDefaultExecutionEnvironment

	| fromFork currentBehaviour |
	
	[DefaultExecutionEnvironment beActive.
	currentBehaviour := MockCurrentBehaviour value.

	[ fromFork := MockCurrentBehaviour value ] fork] fork.

	50 milliSeconds wait.
	fromFork should not be: currentBehaviour