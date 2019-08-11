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
