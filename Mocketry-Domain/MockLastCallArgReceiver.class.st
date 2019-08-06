Class {
	#name : #MockLastCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #printing }
MockLastCallArgReceiver >> stringForSpecValidation [

	^super stringForSpecValidation, ' from last call'
]

{ #category : #accessing }
MockLastCallArgReceiver >> validationSubject [
	
	^argCapture valueFromLastCall
]
