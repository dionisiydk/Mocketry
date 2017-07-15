tests
testCurrentBehaviourShouldNotChangeInsideSingleTest

	| behaviour2  |
	
	behaviour := MockCurrentBehaviour value.
	
	behaviour2 := MockCurrentBehaviour value.

	behaviour2 should be: behaviour