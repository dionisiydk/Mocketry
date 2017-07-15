tests
testHasBehaviourByDefault

	| actual |
	actual := mock ghostBehaviour.
	
	actual should beInstanceOf: MockBehaviour.
	actual where ownerEnvironment should be: CurrentExecutionEnvironment value