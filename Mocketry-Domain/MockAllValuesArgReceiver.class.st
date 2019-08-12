"
I am a special kind of should expression receiver representing captured values from all message sends.
I am used to implement following should expression: 

	Arg argName fromAllCalls should equal: 10.

I validate every value captured from argument of given message send (mock objects call).
To implement it I reuse another should receiver MockConcreteCallArgReceiver. It produce precise validation result with information about what exact value was bad.

I ensure that at least one message was actually sent (at least one value was captured) and in case if it is not true it will be the result of validation.
"
Class {
	#name : #MockAllValuesArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #validation }
MockAllValuesArgReceiver >> validate [
	
	^argCapture validateNumberOfCalls: 1
]

{ #category : #validation }
MockAllValuesArgReceiver >> validate: aSpecOfObjectState [
	| result |
	result := self validate.
	result isSuccess ifFalse: [ ^result ].
	
	1 to: argCapture numberOfCalls do: [:each | 
		result := (argCapture fromCall: each) validate: aSpecOfObjectState.
		result isFailure ifTrue: [ ^result ]].
	^result
]

{ #category : #accessing }
MockAllValuesArgReceiver >> validationSubject [
	self shouldNotImplement 
]
