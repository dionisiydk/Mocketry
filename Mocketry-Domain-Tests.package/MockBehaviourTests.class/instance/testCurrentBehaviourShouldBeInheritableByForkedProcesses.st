tests
testCurrentBehaviourShouldBeInheritableByForkedProcesses

	| fromFork currentBehaviour |
	
	currentBehaviour := MockCurrentBehaviour value.
	currentBehaviour should not be: nil.

	[ fromFork := MockCurrentBehaviour value ] fork.
	20 milliSeconds wait.

	fromFork should be: currentBehaviour