tests
testCurrentBehaviourCleaning1PrepareGarbage

	| actual |
	actual := MockCurrentBehaviour value.
	
	actual testSelector should be: testSelector