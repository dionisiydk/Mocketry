tests
testCurrentBehaviourCleaning4PreviousTestGarbageRemoved

	| actual |
	actual := MockCurrentBehaviour value.
	
	actual testSelector should be: testSelector