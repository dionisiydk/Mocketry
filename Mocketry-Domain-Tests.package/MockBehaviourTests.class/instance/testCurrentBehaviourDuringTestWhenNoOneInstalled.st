tests
testCurrentBehaviourDuringTestWhenNoOneInstalled

	| actual |
	MockCurrentBehaviour value: nil.	
	actual := MockCurrentBehaviour value.
	
	actual should beInstanceOf: MockBehaviour.
	actual where ownerTestCase should be: self.
	actual where testSelector should be: testSelector.
	actual where ownerProcess should be: Processor activeProcess