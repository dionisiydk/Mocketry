evaluating
value

	| currentBehaviour currentEnv |
	currentEnv := CurrentExecutionEnvironment value.
	currentBehaviour := Processor activeProcess psValueAt: index.	
	
	(currentBehaviour notNil and: [currentEnv isMockBehaviourActive: currentBehaviour])
		ifTrue: [ ^currentBehaviour].

	currentBehaviour := currentEnv createMockBehaviour.
	self value: currentBehaviour.
	^currentBehaviour