tests
testCurrentBehaviourCleaning3PrepareWithGarbageCollect

	| actual |
	actual := MockCurrentBehaviour value.
	Smalltalk garbageCollect.
	
	actual testSelector should be: testSelector