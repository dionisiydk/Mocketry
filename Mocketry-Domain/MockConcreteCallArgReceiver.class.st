Class {
	#name : #MockConcreteCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#instVars : [
		'callNumber'
	],
	#category : #'Mocketry-Domain'
}

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
	
	^argCapture fromCall: callNumber
]
