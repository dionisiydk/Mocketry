tests
testGlobalClassStubShouldBeRecoveredWhenCurrentMockBehaviourChanged
	
	| currentBehaviour |
	[
		GHClassStub stub.
		GHClassStub hasGHMutation should be: true.
		currentBehaviour := MockBehaviour new.
		currentBehaviour registerObject: GHClassStub.
		MockCurrentBehaviour value becomeForward: currentBehaviour.
		
		GHClassStub hasGHMutation should be: true.

		MockCurrentBehaviour value should not be: currentBehaviour.
		GHClassStub hasGHMutation should be: false.
	] ensure: [ GHClassStub recoverFromGHMutation ]