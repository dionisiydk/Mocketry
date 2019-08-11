Class {
	#name : #MockSingleCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #validation }
MockSingleCallArgReceiver >> validate [
	^argCapture validateSingleValue
]

{ #category : #accessing }
MockSingleCallArgReceiver >> validationSubject [
	
	^argCapture valueFromCall: 1
]
