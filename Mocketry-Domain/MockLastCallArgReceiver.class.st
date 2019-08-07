Class {
	#name : #MockLastCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #printing }
MockLastCallArgReceiver >> printProperty: aShouldExpressionReceiverProperty [
	^argCapture stringForSpecTitle, ' ', aShouldExpressionReceiverProperty printPath,
		' from last call'
]

{ #category : #printing }
MockLastCallArgReceiver >> stringForSpecTitle [

	^super stringForSpecTitle, ' from last call'
]

{ #category : #accessing }
MockLastCallArgReceiver >> validationSubject [
	
	^argCapture valueFromLastCall
]
