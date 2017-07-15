*Mocketry-Domain
isMockBehaviourActive: aMockBehaviour
	^(super isMockBehaviourActive: aMockBehaviour)
		and: [ aMockBehaviour ownerTestCase == testCase 
			and: [ aMockBehaviour testSelector == testCase selector ] ]