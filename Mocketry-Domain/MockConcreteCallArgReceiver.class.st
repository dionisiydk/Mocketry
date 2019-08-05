Class {
	#name : #MockConcreteCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#instVars : [
		'callNumber'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockConcreteCallArgReceiver class >> from: aMockArgCapture callNumber: aNumber [

	^(self from: aMockArgCapture) 
		callNumber: aNumber
]

{ #category : #accessing }
MockConcreteCallArgReceiver >> callNumber [
	^ callNumber
]

{ #category : #accessing }
MockConcreteCallArgReceiver >> callNumber: anObject [
	callNumber := anObject
]

{ #category : #printing }
MockConcreteCallArgReceiver >> stringForSpecValidation [

	^super stringForSpecValidation, ' in ', callNumber asString, 'th call'
]

{ #category : #accessing }
MockConcreteCallArgReceiver >> validationSubject [
	
	^argCapture valueFromCall: callNumber
]
