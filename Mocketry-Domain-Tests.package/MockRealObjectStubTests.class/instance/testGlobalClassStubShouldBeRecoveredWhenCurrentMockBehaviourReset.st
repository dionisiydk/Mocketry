tests
testGlobalClassStubShouldBeRecoveredWhenCurrentMockBehaviourReset
	
	[
		GHClassStub stub.

		MockCurrentBehaviour value: nil.
		
		GHClassStub hasGHMutation should be: false
	
	] ensure: [ GHClassStub recoverFromGHMutation ]
	