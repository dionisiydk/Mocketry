Class {
	#name : #MockCapturedArgReceiver,
	#superclass : #SpecOfShouldExpressionReceiver,
	#instVars : [
		'argCapture'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #accessing }
MockCapturedArgReceiver >> argCapture [
	^ argCapture
]

{ #category : #accessing }
MockCapturedArgReceiver >> argCapture: anObject [
	argCapture := anObject
]

{ #category : #accessing }
MockCapturedArgReceiver >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionPropertyReceiver of: self message: aMessage
]
