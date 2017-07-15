tests
testGettingBehaviourSecondTimeShouldNotChangeIt

	| actual initialBehaviour |
	initialBehaviour := mock ghostBehaviour.
	
	MockCurrentBehaviour value: MockBehaviour new.
	
	actual := mock ghostBehaviour.
	
	actual should be: initialBehaviour