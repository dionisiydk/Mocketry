"
I am base class for different kind of specifications for occurred message sends
"
Class {
	#name : #SpecOfOccurredMessages,
	#superclass : #SpecOfObjectState,
	#category : 'Mocketry-Specs'
}

{ #category : #testing }
SpecOfOccurredMessages class >> isAbstract [ 
	^self = SpecOfOccurredMessages
]

{ #category : #converting }
SpecOfOccurredMessages >> asInteractionSpecBetweenAll: expectedReceivers [
	self subclassResponsibility 
]

{ #category : #accessing }
SpecOfOccurredMessages >> populateMultipleMessagesSpec: aMultipleMessagesSpec [
	self subclassResponsibility 
]
