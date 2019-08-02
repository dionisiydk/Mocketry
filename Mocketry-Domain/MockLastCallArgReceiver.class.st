Class {
	#name : #MockLastCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #accessing }
MockLastCallArgReceiver >> validationSubject [
	
	^argCapture valueFromLastCall
]
