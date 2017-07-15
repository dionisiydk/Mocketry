*Mocketry-Domain
setUpMockNameFor: aMock inContextOf: ownerProcess
	| testContext currentReceiver |
	testContext := Processor activeProcess == ownerProcess 
		ifTrue: [ thisContext ] ifFalse: [ownerProcess suspendedContext].
		
	[testContext isNil or: [ testContext receiver ghostClass isTestCase]] whileFalse: [ testContext := testContext sender ].
	
	[testContext notNil and: [testContext receiver ghostClass isTestCase]] whileTrue: [ 
		currentReceiver := testContext receiver.
		currentReceiver class allInstVarNames do: [ :each | 
			(currentReceiver instVarNamed: each) == aMock ifTrue: [ ^aMock mockName: each ]].		
		testContext tempNames do: [ :each  |
			(testContext tempNamed: each) == aMock ifTrue: [ ^aMock mockName: each ]].
		
		testContext := testContext sender
	]