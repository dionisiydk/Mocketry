Class {
	#name : #MockSingleCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #accessing }
MockSingleCallArgReceiver >> validationSubject [
	argCapture validateSingleValue.
	
	^argCapture fromFirstCall
]
