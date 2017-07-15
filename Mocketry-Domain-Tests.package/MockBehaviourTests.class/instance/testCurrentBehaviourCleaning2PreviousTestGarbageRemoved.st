tests
testCurrentBehaviourCleaning2PreviousTestGarbageRemoved

	| actual |
	actual := MockCurrentBehaviour value.
	
	actual testSelector should be: testSelector